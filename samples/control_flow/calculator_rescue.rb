# frozen_string_literal: true
# Calculator with a custom exception hierarchy and multiple rescue clauses
class CalcError < StandardError; end
class DivideByZero < CalcError; end
class UnknownOp < CalcError; end

def calc(a, op, b)
  case op
  when :add then a + b
  when :sub then a - b
  when :div
    raise DivideByZero, "cannot divide #{a} by zero" if b == 0
    a / b
  else
    raise UnknownOp, "no such op: #{op}"
  end
end

def safe_calc(a, op, b)
  calc(a, op, b)
rescue DivideByZero => e
  "div-error: #{e.message}"
rescue CalcError => e
  "calc-error(#{e.class}): #{e.message}"
end

p safe_calc(10, :add, 5)
p safe_calc(10, :div, 2)
p safe_calc(10, :div, 0)
p safe_calc(10, :pow, 2)
