# frozen_string_literal: true
# UnboundMethod#dup
class Calc
  def add(n); n + 1; end
end

p(Calc.instance_method(:add).dup.name)
um001 = Calc.instance_method(:add); d001 = um001.dup; v001 = d001.name; p v001

p(Calc.instance_method(:add).dup.arity)
um002 = Calc.instance_method(:add); d002 = um002.dup; v002 = d002.arity; p v002
