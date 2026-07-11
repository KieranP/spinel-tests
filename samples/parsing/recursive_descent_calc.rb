# frozen_string_literal: true
# Recursive-descent arithmetic evaluator with precedence and parentheses.
# Inference: a String is tokenized to an Array(String), then parsed by mutually
# recursive methods that all return Float — the recursion must resolve first.

class Calc
  def initialize(tokens)
    @tokens = tokens
    @pos = 0
  end

  def self.eval(str)
    tokens = str.scan(/\d+\.?\d*|[-+*\/()]/)
    new(tokens).expr
  end

  def peek = @tokens[@pos]

  def advance
    t = @tokens[@pos]
    @pos += 1
    t
  end

  def expr
    value = term
    while peek == "+" || peek == "-"
      op = peek
      advance
      rhs = term
      value = op == "+" ? value + rhs : value - rhs
    end
    value
  end

  def term
    value = factor
    while peek == "*" || peek == "/"
      op = peek
      advance
      rhs = factor
      value = op == "*" ? value * rhs : value / rhs
    end
    value
  end

  def factor
    if peek == "("
      advance
      value = expr
      advance # ')'
      value
    else
      t = peek
      advance
      t.to_f
    end
  end
end

p Calc.eval("1 + 2 * 3")
p Calc.eval("(1 + 2) * 3")
p Calc.eval("10 / 4 - 1")
p Calc.eval("2 * (3 + 4) * 5")
p Calc.eval("100 - 10 - 5")
