# frozen_string_literal: true
# UnboundMethod#to_s
class Calc
  def add(n); n + 1; end
end

# Spinel's UnboundMethod#to_s returns "[]" instead of "#<UnboundMethod: Calc#add(n) ...>"
p(Calc.instance_method(:add).to_s.start_with?("#<UnboundMethod:"))
um001 = Calc.instance_method(:add); v001 = um001.to_s.start_with?("#<UnboundMethod:"); p v001
