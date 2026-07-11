# frozen_string_literal: true
# UnboundMethod#eql?
class Calc
  def add(n); n + 1; end
end

p(Calc.instance_method(:add).eql?(Calc.instance_method(:add)))
um001 = Calc.instance_method(:add); um002 = Calc.instance_method(:add); v001 = um001.eql?(um002); p v001
