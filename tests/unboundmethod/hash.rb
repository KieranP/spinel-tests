# frozen_string_literal: true
# UnboundMethod#hash
class Calc
  def add(n); n + 1; end
end

# address/seed-dependent value: assert stable shape + that equal methods hash equal
p(Calc.instance_method(:add).hash.class)
um001 = Calc.instance_method(:add); v001 = um001.hash.class; p v001

p(Calc.instance_method(:add).hash == Calc.instance_method(:add).hash)
um002 = Calc.instance_method(:add); um003 = Calc.instance_method(:add); v002 = (um002.hash == um003.hash); p v002
