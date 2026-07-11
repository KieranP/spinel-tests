# frozen_string_literal: true
# Reverse-Polish-notation evaluator driven by a stack of Integers.
# Inference: tokens are Strings; operands are Integers pushed/popped from one
# Array — the operator dispatch must keep the stack element type stable.

def evaluate(expr)
  stack = []
  expr.split.each do |tok|
    case tok
    when "+" then b = stack.pop; a = stack.pop; stack.push(a + b)
    when "-" then b = stack.pop; a = stack.pop; stack.push(a - b)
    when "*" then b = stack.pop; a = stack.pop; stack.push(a * b)
    when "/" then b = stack.pop; a = stack.pop; stack.push(a / b)
    else stack.push(tok.to_i)
    end
  end
  stack.pop
end

p evaluate("3 4 +")
p evaluate("5 1 2 + 4 * + 3 -")
p evaluate("2 3 4 * +")
p evaluate("100 5 / 3 -")
