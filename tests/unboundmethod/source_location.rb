# frozen_string_literal: true
# UnboundMethod#source_location
class Calc
  def add(n); n + 1; end
end

# Ruby: source_location returns [file, lineno] (an Array). Under Spinel the chained
# .class raises NoMethodError ("undefined method 'class' for unknown").
r001 = (Calc.instance_method(:add).source_location.class rescue $!.class); p r001
um002 = Calc.instance_method(:add); r002 = (um002.source_location.class rescue $!.class); p r002

p(Calc.instance_method(:add).source_location)
um003 = Calc.instance_method(:add); v003 = um003.source_location; p v003
