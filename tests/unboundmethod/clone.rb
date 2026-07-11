# frozen_string_literal: true
# UnboundMethod#clone
class Calc
  def add(n); n + 1; end
end

p(Calc.instance_method(:add).clone.name)
um001 = Calc.instance_method(:add); c001 = um001.clone; v001 = c001.name; p v001

p(Calc.instance_method(:add).clone.arity)
um002 = Calc.instance_method(:add); c002 = um002.clone; v002 = c002.arity; p v002
