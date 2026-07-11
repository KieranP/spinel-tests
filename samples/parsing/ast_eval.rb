# frozen_string_literal: true
# AST nodes evaluated via case/in pattern matching
Num = Struct.new(:value)
Add = Struct.new(:left, :right)
Mul = Struct.new(:left, :right)
Neg = Struct.new(:operand)

def evaluate(node)
  case node
  in Num[value]
    value
  in Add[left, right]
    evaluate(left) + evaluate(right)
  in Mul[left, right]
    evaluate(left) * evaluate(right)
  in Neg[operand]
    -evaluate(operand)
  end
end

tree = Add.new(Mul.new(Num.new(3), Num.new(4)), Neg.new(Num.new(5)))
puts evaluate(tree)
puts evaluate(Num.new(42))
puts evaluate(Mul.new(Add.new(Num.new(1), Num.new(2)), Num.new(10)))
result = evaluate(tree)
p result
