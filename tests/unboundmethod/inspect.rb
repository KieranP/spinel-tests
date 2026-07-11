# frozen_string_literal: true
# UnboundMethod#inspect
class Calc
  def add(n); n + 1; end
end

# Spinel's UnboundMethod#inspect returns "[]" instead of "#<UnboundMethod: Calc#add(n) ...>"
p(Calc.instance_method(:add).inspect.start_with?("#<UnboundMethod:"))
um001 = Calc.instance_method(:add); v001 = um001.inspect.start_with?("#<UnboundMethod:"); p v001
