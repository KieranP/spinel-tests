# frozen_string_literal: true
# Tiny arithmetic-expression evaluator over an explicit AST of node classes.
# Inference: Num/BinOp form a recursive tree whose #eval returns a Float; the
# polymorphic #eval dispatch is the whole-program-inference showcase.

class Num
  def initialize(value) = @value = value
  def eval = @value.to_f
end

class BinOp
  def initialize(op, left, right)
    @op = op
    @left = left
    @right = right
  end

  def eval
    l = @left.eval
    r = @right.eval
    case @op
    when :+ then l + r
    when :- then l - r
    when :* then l * r
    when :/ then l / r
    end
  end
end

# (2 + 3) * (10 - 4) / 2
tree = BinOp.new(:/,
          BinOp.new(:*,
            BinOp.new(:+, Num.new(2), Num.new(3)),
            BinOp.new(:-, Num.new(10), Num.new(4))),
          Num.new(2))

p tree.eval
p Num.new(42).eval
p BinOp.new(:+, Num.new(1), Num.new(2)).eval
