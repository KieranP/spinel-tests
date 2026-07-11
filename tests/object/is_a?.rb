# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
  def to_s; "Obj-to-s"; end
  def inspect; "#<Obj-inspect>"; end
end

# Object#is_a?
p(5.is_a?(Integer))
v039 = 5.is_a?(Integer); p v039
p(5.is_a?(Numeric))
v040 = 5.is_a?(Numeric); p v040
p(5.is_a?(String))
v041 = 5.is_a?(String); p v041
p("x".is_a?(Comparable))
v042 = "x".is_a?(Comparable); p v042
o231 = Obj195.new
p(o231.is_a?(Object))
v043 = o231.is_a?(Object); p v043
p(o231.is_a?(Obj195))
v044 = o231.is_a?(Obj195); p v044
p([].is_a?(Enumerable))
p(5.is_a?(Kernel))
p(5.is_a?(BasicObject))
p(5.is_a?(Float))
p((2**70).is_a?(Integer))
p(nil.is_a?(NilClass))
a051 = [1, 2]; p(a051.is_a?(Enumerable))
# A ::-scoped class argument on a built-in receiver raises NoMethodError at runtime:
r050 = (5.is_a?(::Integer) rescue $!.class); p r050

# Inheritance chain + module through a user class
module Walks195; end
module Swims195; end
class Animal195; end
class Fish195 < Animal195
  include Swims195
end
f195 = Fish195.new
p(f195.is_a?(Fish195))
w195 = f195.is_a?(Fish195); p w195
p(f195.is_a?(Animal195))
w196 = f195.is_a?(Animal195); p w196
p(f195.is_a?(Swims195))
w197 = f195.is_a?(Swims195); p w197
p(f195.is_a?(Walks195))
w198 = f195.is_a?(Walks195); p w198
p(f195.is_a?(BasicObject))
a195 = Animal195.new
p(a195.is_a?(Fish195))
w199 = a195.is_a?(Fish195); p w199

module IsAExt970
  def tag970 = :tagged
end
class IsAExtBase970
end
o972 = IsAExtBase970.new; o972.extend(IsAExt970); p(o972.is_a?(IsAExt970))
o973 = IsAExtBase970.new; o973.extend(IsAExt970); w973 = o973.is_a?(IsAExt970); p w973
o974 = IsAExtBase970.new; p(o974.is_a?(IsAExt970)); o974.extend(IsAExt970)
o975 = IsAExtBase970.new; w975 = o975.is_a?(IsAExt970); p w975; o975.extend(IsAExt970)
