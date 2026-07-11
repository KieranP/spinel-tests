# frozen_string_literal: true
# A tiny stack bytecode VM with integer registers stored in a Hash.
# Inference: instructions are [Symbol, arg] pairs; the operand stack is
# Array(Integer) and the variable store is Hash{Symbol=>Integer}.

def run(program)
  stack = []
  vars = { result: 0 }
  program.each do |op, arg|
    case op
    when :push then stack.push(arg)
    when :load then stack.push(vars[arg])
    when :store then vars[arg] = stack.pop
    when :add then b = stack.pop; a = stack.pop; stack.push(a + b)
    when :sub then b = stack.pop; a = stack.pop; stack.push(a - b)
    when :mul then b = stack.pop; a = stack.pop; stack.push(a * b)
    when :dup then stack.push(stack.last)
    end
  end
  vars
end

# (3 + 4) * 2, stored to :result; then result squared into :sq
program = [
  [:push, 3], [:push, 4], [:add,
  nil], [:push, 2], [:mul, nil], [:store, :result],
  [:load, :result], [:dup, nil], [:mul, nil], [:store, :sq],
]

final = run(program)
p final[:result]
p final[:sq]
p final.keys.sort
