# frozen_string_literal: true
# A command interpreter dispatching Symbol opcodes to Proc handlers in a Hash.
# Inference: a Hash{Symbol=>Proc} whose values are invoked with arguments stresses
# storing and calling callables read back out of a container.

HANDLERS = {
  add: ->(a, b) { a + b },
  sub: ->(a, b) { a - b },
  mul: ->(a, b) { a * b },
  neg: ->(a, _b) { -a },
}

def run(cmd, a, b)
  HANDLERS[cmd].call(a, b)
end

program = [[:add, 3, 4], [:mul, 5, 6], [:sub, 10, 3], [:neg, 8, 0]]
results = program.map { |cmd, a, b| run(cmd, a, b) }

p results
p results.sum
p HANDLERS.keys.sort
p HANDLERS[:add].call(100, 1)
