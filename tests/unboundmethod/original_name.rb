# frozen_string_literal: true
# UnboundMethod#original_name
class Calc
  def add(n); n + 1; end
end

p(Calc.instance_method(:add).original_name)
um001 = Calc.instance_method(:add); v001 = um001.original_name; p v001
