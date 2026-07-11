# frozen_string_literal: true
# A Pratt (top-down operator precedence) parser for an expression language with
# prefix, infix, postfix, right-associative and ternary operators, plus calls and
# indexing. Each token kind carries its own binding powers in a table, the parser
# builds an AST of nested user nodes, and the AST is then pretty-printed fully
# parenthesised and evaluated, so a precedence mistake changes both outputs.
# Inference: a Hash{Symbol=>Struct} of binding powers driving a recursive parser whose
# return type is a recursive Node, and an evaluator whose case/in arms must unify to
# one numeric type across binary, unary and call nodes.

Token = Struct.new(:kind, :text) do
  def to_s = text
end

Num  = Struct.new(:value)
Name = Struct.new(:ident)
Un   = Struct.new(:op, :operand)
Post = Struct.new(:op, :operand)
Bin  = Struct.new(:op, :left, :right)
Tern = Struct.new(:cond, :then_branch, :else_branch)
Call = Struct.new(:callee, :args)
Idx  = Struct.new(:target, :index)

Power = Struct.new(:left, :right)

INFIX = {
  "?"  => Power.new(4, 3),
  "||" => Power.new(6, 7),
  "&&" => Power.new(8, 9),
  "==" => Power.new(10, 11),
  "<"  => Power.new(12, 13),
  ">"  => Power.new(12, 13),
  "+"  => Power.new(14, 15),
  "-"  => Power.new(14, 15),
  "*"  => Power.new(16, 17),
  "/"  => Power.new(16, 17),
  "**" => Power.new(21, 20)
}.freeze

PREFIX = { "-" => 19, "+" => 19, "!" => 19 }.freeze
POSTFIX = { "!" => 23, "?" => 23 }.freeze

def lex(src)
  tokens = []
  src.scan(/\d+\.\d+|\d+|[a-z_]\w*|\*\*|==|&&|\|\||[-+*\/<>!?()\[\],:]/) do |text|
    kind =
      case text
      when /\A\d+\.\d+\z/ then :float
      when /\A\d+\z/ then :int
      when /\A[a-z_]\w*\z/ then :name
      else :op
      end
    tokens << Token.new(kind, text)
  end
  tokens << Token.new(:eof, "")
  tokens
end

class Parser
  def initialize(tokens)
    @tokens = tokens
    @pos = 0
  end

  def peek = @tokens[@pos]
  def advance = @tokens[@pos].tap { @pos += 1 }

  def expect(text)
    tok = advance
    raise ArgumentError, "expected #{text}, got #{tok.text.inspect}" unless tok.text == text

    tok
  end

  def parse
    node = expression(0)
    raise ArgumentError, "trailing input at #{peek.text.inspect}" unless peek.kind == :eof

    node
  end

  def expression(min_bp)
    left = nud
    loop do
      tok = peek
      break if tok.kind == :eof

      if POSTFIX.key?(tok.text) && !INFIX.key?(tok.text) || postfix_here?(tok)
        bp = POSTFIX[tok.text]
        break if bp < min_bp

        advance
        left = Post.new(tok.text, left)
        next
      end

      if tok.text == "("
        break if 25 < min_bp

        advance
        left = Call.new(left, arguments)
        next
      end

      if tok.text == "["
        break if 25 < min_bp

        advance
        index = expression(0)
        expect("]")
        left = Idx.new(left, index)
        next
      end

      power = INFIX[tok.text]
      break if power.nil? || power.left < min_bp

      advance
      left =
        if tok.text == "?"
          then_branch = expression(0)
          expect(":")
          Tern.new(left, then_branch, expression(power.right))
        else
          Bin.new(tok.text, left, expression(power.right))
        end
    end
    left
  end

  private

  def postfix_here? (tok)
    return false unless tok.text == "!" || tok.text == "?"

    nxt = @tokens[@pos + 1]
    return true if nxt.nil?

    tok.text == "!" ? true : false
  end

  def arguments
    args = []
    if peek.text != ")"
      args << expression(0)
      while peek.text == ","
        advance
        args << expression(0)
      end
    end
    expect(")")
    args
  end

  def nud
    tok = advance
    case tok.kind
    when :int then Num.new(tok.text.to_i)
    when :float then Num.new(tok.text.to_f)
    when :name then Name.new(tok.text)
    when :op
      if tok.text == "("
        inner = expression(0)
        expect(")")
        inner
      elsif PREFIX.key?(tok.text)
        Un.new(tok.text, expression(PREFIX.fetch(tok.text)))
      else
        raise ArgumentError, "unexpected #{tok.text.inspect}"
      end
    else raise ArgumentError, "unexpected #{tok.kind}"
    end
  end
end

def show(node)
  case node
  when Num then node.value.to_s
  when Name then node.ident
  when Un then "(#{node.op}#{show(node.operand)})"
  when Post then "(#{show(node.operand)}#{node.op})"
  when Bin then "(#{show(node.left)} #{node.op} #{show(node.right)})"
  when Tern then "(#{show(node.cond)} ? #{show(node.then_branch)} : #{show(node.else_branch)})"
  when Call then "#{show(node.callee)}(#{node.args.map { |a| show(a) }.join(", ")})"
  when Idx then "#{show(node.target)}[#{show(node.index)}]"
  else "?"
  end
end

ENVIRONMENT = { "x" => 3, "y" => 4, "z" => 0, "pi" => 3.5 }.freeze
LISTS = { "xs" => [10, 20, 30] }.freeze

def evaluate(node)
  case node
  when Num then node.value
  when Name then ENVIRONMENT.fetch(node.ident) { LISTS.fetch(node.ident) }
  when Un
    v = evaluate(node.operand)
    case node.op
    when "-" then -v
    when "+" then v
    when "!" then v.zero? ? 1 : 0
    else raise ArgumentError, "bad prefix #{node.op}"
    end
  when Post
    v = evaluate(node.operand)
    node.op == "!" ? (1..v.to_i).reduce(1) { |a, b| a * b } : v
  when Bin then binary(node)
  when Tern then evaluate(node.cond) != 0 ? evaluate(node.then_branch) : evaluate(node.else_branch)
  when Call
    args = node.args.map { |a| evaluate(a) }
    name = node.callee.is_a?(Name) ? node.callee.ident : "?"
    case name
    when "max" then args.max
    when "min" then args.min
    when "sum" then args.sum
    else raise ArgumentError, "unknown function #{name}"
    end
  when Idx then evaluate(node.target)[evaluate(node.index)]
  else raise ArgumentError, "bad node"
  end
end

def binary(node)
  l = evaluate(node.left)
  r = evaluate(node.right)
  case node.op
  when "+" then l + r
  when "-" then l - r
  when "*" then l * r
  when "/" then r.zero? ? 0 : l / r
  when "**" then l**r
  when "<" then l < r ? 1 : 0
  when ">" then l > r ? 1 : 0
  when "==" then l == r ? 1 : 0
  when "&&" then (l != 0 && r != 0) ? 1 : 0
  when "||" then (l != 0 || r != 0) ? 1 : 0
  else raise ArgumentError, "bad operator #{node.op}"
  end
end

EXPRESSIONS = [
  "1 + 2 * 3",
  "(1 + 2) * 3",
  "2 ** 3 ** 2",
  "-x * y",
  "-(x * y)",
  "x + y * x - y / x",
  "x < y && y < 10",
  "x == 3 ? y : z",
  "max(x, y, x * y)",
  "sum(1, 2, 3) + min(9, 4)",
  "xs[1] + xs[2]",
  "4!",
  "1 + 2 < 4 && 3 > 2"
].freeze

puts "== parse, print fully parenthesised, evaluate =="
EXPRESSIONS.each do |src|
  ast = Parser.new(lex(src)).parse
  printed = show(ast)
  value = evaluate(ast)
  puts format("  %-22s %-34s = %s", src, printed, value.inspect)
end

puts
puts "== associativity =="
[["2 ** 3 ** 2", "right"], ["1 - 2 - 3", "left"], ["1 + 2 + 3 + 4", "left"]].each do |src, expected|
  puts format("  %-14s %-24s (%s-associative)", src, show(Parser.new(lex(src)).parse), expected)
end

puts
puts "== reparsing the printed form is a fixed point =="
EXPRESSIONS.each do |src|
  once = show(Parser.new(lex(src)).parse)
  twice = show(Parser.new(lex(once)).parse)
  next if once == twice

  puts "  NOT STABLE: #{src} -> #{once} -> #{twice}"
end
stable = EXPRESSIONS.all? do |src|
  once = show(Parser.new(lex(src)).parse)
  once == show(Parser.new(lex(once)).parse)
end
puts "  all #{EXPRESSIONS.size} expressions round-trip: #{stable}"

puts
puts "== token stream for one expression =="
lex("max(x, y) ** 2 + xs[0]").each { |t| print "#{t.kind}:#{t.text} " }
puts

puts
puts "== parse errors =="
["1 +", "(1 + 2", "1 2", "* 3", "xs[1"].each do |src|
  result = (show(Parser.new(lex(src)).parse) rescue "#{$!.class}: #{$!.message}")
  puts format("  %-8s -> %s", src, result)
end
