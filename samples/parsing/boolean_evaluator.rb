# frozen_string_literal: true
# Evaluate boolean expression trees and build truth tables.
# Inference: nested Array expression nodes ([:and, l, r], [:not, x], [:var, name]),
# recursive evaluation dispatching on the operator Symbol, and a Hash environment.

def evaluate(expr, env)
  case expr
  in true | false
    expr
  in [:var, name]
    env.fetch(name)
  in [:not, sub]
    !evaluate(sub, env)
  in [:and, left, right]
    evaluate(left, env) && evaluate(right, env)
  in [:or, left, right]
    evaluate(left, env) || evaluate(right, env)
  in [:xor, left, right]
    evaluate(left, env) ^ evaluate(right, env)
  end
end

# (A AND B) OR (NOT A)
expr = [:or, [:and, [:var, "A"], [:var, "B"]], [:not, [:var, "A"]]]

[[true, true], [true, false], [false, true], [false, false]].each do |a, b|
  env = { "A" => a, "B" => b }
  puts "A=#{a} B=#{b} => #{evaluate(expr, env)}"
end

# XOR is true for exactly one input
xor = [:xor, [:var, "A"], [:var, "B"]]
truths = [[true, false], [false, true], [true, true], [false, false]].map do |a, b|
  evaluate(xor, { "A" => a, "B" => b })
end
puts "xor truth column: #{truths.inspect}"

# count satisfying assignments
sat = [[true, true], [true, false], [false, true], [false, false]].count do |a, b|
  evaluate(expr, { "A" => a, "B" => b })
end
puts "satisfying assignments: #{sat}"
p evaluate([:not, [:not, true]], {})
p evaluate([:and, true, [:or, false, true]], {})
