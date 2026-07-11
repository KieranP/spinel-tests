# frozen_string_literal: true
# An arithmetic AST walked by four visitors: one prints, one evaluates, one folds
# constants into a *new* tree, and one collects statistics. Dispatch is double: the
# node picks the visitor method, the visitor decides what to do with the node.
# Inference: a recursive node hierarchy whose children are any sibling type, an
# `accept` whose return type differs per visitor (String, Integer, Node, nil), and a
# visitor that rebuilds nodes so its result feeds straight back into another visitor.

class Node
  def accept(_visitor) = raise NotImplementedError, "#{self.class}#accept"
  def children = []
end

class Num < Node
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def accept(visitor) = visitor.visit_num(self)
end

class Var < Node
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def accept(visitor) = visitor.visit_var(self)
end

class BinOp < Node
  attr_reader :op, :left, :right

  def initialize(op, left, right)
    @op = op
    @left = left
    @right = right
  end

  def accept(visitor) = visitor.visit_binop(self)
  def children = [@left, @right]
end

class Neg < Node
  attr_reader :operand

  def initialize(operand)
    @operand = operand
  end

  def accept(visitor) = visitor.visit_neg(self)
  def children = [@operand]
end

class Call < Node
  attr_reader :name, :args

  def initialize(name, args)
    @name = name
    @args = args
  end

  def accept(visitor) = visitor.visit_call(self)
  def children = @args
end

class Printer
  PRECEDENCE = { "+" => 1, "-" => 1, "*" => 2, "/" => 2, "%" => 2, "**" => 3 }.freeze

  def visit_num(node) = node.value.to_s
  def visit_var(node) = node.name.to_s

  def visit_binop(node)
    left = wrap(node.left, node.op, :left)
    right = wrap(node.right, node.op, :right)
    "#{left} #{node.op} #{right}"
  end

  def visit_neg(node)
    inner = node.operand.accept(self)
    node.operand.is_a?(BinOp) ? "-(#{inner})" : "-#{inner}"
  end

  def visit_call(node) = "#{node.name}(#{node.args.map { |a| a.accept(self) }.join(', ')})"

  private

  def wrap(child, parent_op, side)
    text = child.accept(self)
    return text unless child.is_a?(BinOp)

    outer = PRECEDENCE.fetch(parent_op)
    inner = PRECEDENCE.fetch(child.op)
    return "(#{text})" if inner < outer
    return "(#{text})" if inner == outer && side == :right && ["-", "/", "%"].include?(parent_op)

    text
  end
end

class Evaluator
  FUNCTIONS = {
    "max" => ->(args) { args.max },
    "min" => ->(args) { args.min },
    "abs" => ->(args) { args.first.abs },
    "sum" => ->(args) { args.sum }
  }.freeze

  def initialize(env)
    @env = env
  end

  def visit_num(node) = node.value

  def visit_var(node)
    raise KeyError, "unbound variable #{node.name}" unless @env.key?(node.name)

    @env.fetch(node.name)
  end

  def visit_binop(node)
    a = node.left.accept(self)
    b = node.right.accept(self)
    case node.op
    when "+" then a + b
    when "-" then a - b
    when "*" then a * b
    when "/" then a / b
    when "%" then a % b
    when "**" then a**b
    else raise ArgumentError, "unknown operator #{node.op}"
    end
  end

  def visit_neg(node) = -node.operand.accept(self)

  def visit_call(node)
    fn = FUNCTIONS[node.name] or raise NoMethodError, "no function #{node.name}"
    fn.call(node.args.map { |a| a.accept(self) })
  end
end

# Rebuilds the tree, replacing any subtree with no free variables by its value.
class ConstantFolder
  def visit_num(node) = node

  def visit_var(node) = node

  def visit_binop(node)
    left = node.left.accept(self)
    right = node.right.accept(self)
    return Num.new(evaluate(BinOp.new(node.op, left, right))) if left.is_a?(Num) && right.is_a?(Num)

    BinOp.new(node.op, left, right)
  end

  def visit_neg(node)
    inner = node.operand.accept(self)
    inner.is_a?(Num) ? Num.new(-inner.value) : Neg.new(inner)
  end

  def visit_call(node)
    args = node.args.map { |a| a.accept(self) }
    rebuilt = Call.new(node.name, args)
    return Num.new(evaluate(rebuilt)) if args.all?(Num)

    rebuilt
  end

  private

  def evaluate(node) = node.accept(Evaluator.new({}))
end

class Stats
  attr_reader :counts, :max_depth, :variables

  def initialize
    @counts = Hash.new(0)
    @depth = 0
    @max_depth = 0
    @variables = []
  end

  def visit_num(node) = record(node)
  def visit_binop(node) = record(node)
  def visit_neg(node) = record(node)
  def visit_call(node) = record(node)

  def visit_var(node)
    @variables << node.name
    record(node)
  end

  def leaves = @counts[:Num] + @counts[:Var]

  private

  def record(node)
    @counts[node.class.name.to_sym] += 1
    @depth += 1
    @max_depth = [@max_depth, @depth].max
    node.children.each { |child| child.accept(self) }
    @depth -= 1
    node
  end
end

def depth_of(node)
  kids = node.children
  return 1 if kids.empty?

  1 + kids.map { |k| depth_of(k) }.max
end

# ((3 + 4) * x) - -(2 ** 3) + max(10, 2 * 3, y)
TREE = BinOp.new(
  "+",
  BinOp.new(
    "-",
    BinOp.new("*", BinOp.new("+", Num.new(3), Num.new(4)), Var.new("x")),
    Neg.new(BinOp.new("**", Num.new(2), Num.new(3)))
  ),
  Call.new("max", [Num.new(10), BinOp.new("*", Num.new(2), Num.new(3)), Var.new("y")])
)

printer = Printer.new

puts "== the tree =="
puts TREE.accept(printer)
puts "depth: #{depth_of(TREE)}"

puts
puts "== evaluating under three environments =="
[{ "x" => 5, "y" => 1 }, { "x" => 0, "y" => 100 }, { "x" => -3, "y" => 7 }].each do |env|
  value = TREE.accept(Evaluator.new(env))
  puts format("  x=%-3d y=%-4d -> %d", env["x"], env["y"], value)
end

puts
puts "== constant folding rebuilds the tree =="
folded = TREE.accept(ConstantFolder.new)
puts "before: #{TREE.accept(printer)}"
puts "after:  #{folded.accept(printer)}"
puts "depth #{depth_of(TREE)} -> #{depth_of(folded)}"
env = { "x" => 5, "y" => 1 }
puts "folded tree still evaluates the same: " \
     "#{TREE.accept(Evaluator.new(env)) == folded.accept(Evaluator.new(env))}"

puts
puts "== a fully constant tree folds to a single node =="
closed = BinOp.new("/", Call.new("sum", [Num.new(10), Num.new(20), Num.new(12)]), Num.new(6))
closed_folded = closed.accept(ConstantFolder.new)
puts "#{closed.accept(printer)}  ==>  #{closed_folded.accept(printer)}"
puts "is a Num: #{closed_folded.is_a?(Num)}, value #{closed_folded.value}"

puts
puts "== statistics visitor =="
[TREE, folded, closed].each_with_index do |tree, i|
  stats = Stats.new
  tree.accept(stats)
  puts format("  tree %d: nodes=%2d leaves=%d depth=%d vars=%s",
              i, stats.counts.values.sum, stats.leaves, stats.max_depth, stats.variables.inspect)
  puts "           by class: #{stats.counts.sort.to_h.inspect}"
end

puts
puts "== printing respects precedence =="
cases = [
  BinOp.new("*", BinOp.new("+", Num.new(1), Num.new(2)), Num.new(3)),
  BinOp.new("+", BinOp.new("*", Num.new(1), Num.new(2)), Num.new(3)),
  BinOp.new("-", Num.new(1), BinOp.new("-", Num.new(2), Num.new(3))),
  BinOp.new("-", BinOp.new("-", Num.new(1), Num.new(2)), Num.new(3)),
  BinOp.new("/", Num.new(8), BinOp.new("/", Num.new(4), Num.new(2))),
  Neg.new(BinOp.new("+", Var.new("a"), Num.new(1)))
]
cases.each do |c|
  printed = c.accept(printer)
  value = (c.accept(Evaluator.new({ "a" => 9 })) rescue "#{$!.class}")
  puts format("  %-16s = %s", printed, value)
end

puts
puts "== error paths =="
probes = [
  ["unbound variable", -> { Var.new("zzz").accept(Evaluator.new({})) }],
  ["unknown function", -> { Call.new("nope", [Num.new(1)]).accept(Evaluator.new({})) }],
  ["bad operator", -> { BinOp.new("^", Num.new(1), Num.new(2)).accept(Evaluator.new({})) }],
  ["divide by zero", -> { BinOp.new("/", Num.new(1), Num.new(0)).accept(Evaluator.new({})) }],
  ["abstract accept", -> { Node.new.accept(Printer.new) }]
]
probes.each do |label, thunk|
  outcome = begin
    thunk.call.to_s
  rescue StandardError, NotImplementedError => e
    "#{e.class}: #{e.message}"
  end
  puts format("  %-18s -> %s", label, outcome)
end
