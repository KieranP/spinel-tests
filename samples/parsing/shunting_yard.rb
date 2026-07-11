# frozen_string_literal: true
# Infix -> RPN conversion via Dijkstra's shunting-yard, then evaluation.
# Inference: a precedence Hash keyed by operator String, two Array stacks, and a
# fold that dispatches on operator to compute Integer results.

PREC = { "+" => 1, "-" => 1, "*" => 2, "/" => 2 }.freeze

def to_rpn(tokens)
  output = []
  ops = []
  tokens.each do |tok|
    if tok =~ /\A\d+\z/
      output << tok
    elsif PREC.key?(tok)
      while !ops.empty? && ops.last != "(" && PREC[ops.last] >= PREC[tok]
        output << ops.pop
      end
      ops << tok
    elsif tok == "("
      ops << tok
    elsif tok == ")"
      output << ops.pop while ops.last != "("
      ops.pop
    end
  end
  output.concat(ops.reverse)
  output
end

def eval_rpn(rpn)
  stack = []
  rpn.each do |tok|
    if tok =~ /\A\d+\z/
      stack << tok.to_i
    else
      b = stack.pop
      a = stack.pop
      stack << case tok
               when "+" then a + b
               when "-" then a - b
               when "*" then a * b
               when "/" then a / b
               end
    end
  end
  stack.first
end

expr = %w[3 + 4 * 2 - ( 1 + 1 )]
rpn = to_rpn(expr)
puts "rpn: #{rpn.join(' ')}"
puts "result: #{eval_rpn(rpn)}"

cases = [%w[2 + 3], %w[2 * 3 + 4], %w[( 2 + 3 ) * 4]]
cases.each { |c| puts "#{c.join(' ')} = #{eval_rpn(to_rpn(c))}" }
p eval_rpn(to_rpn(%w[10 - 2 - 3]))
