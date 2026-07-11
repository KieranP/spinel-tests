# frozen_string_literal: true
# Higher-order functions: build and compose Procs, then run a pipeline.
# Inference: methods that return Procs, and a fold over an Array(Proc), stress
# closure typing — each stage is Integer -> Integer.

def adder(n) = ->(x) { x + n }
def multiplier(n) = ->(x) { x * n }

def compose(fns)
  fns.reduce(->(x) { x }) do |acc, f|
    ->(x) { f.call(acc.call(x)) }
  end
end

pipeline = compose([adder(3), multiplier(2), adder(-1)])

p pipeline.call(5)
p (1..5).map { |x| pipeline.call(x) }

counter = 0
tick = -> { counter += 1 }
3.times { tick.call }
p counter
