# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
  def to_s; "Obj-to-s"; end
  def inspect; "#<Obj-inspect>"; end
end

# Object#kind_of?
p(5.kind_of?(Integer))
v045 = 5.kind_of?(Integer); p v045
p(5.kind_of?(Numeric))
v046 = 5.kind_of?(Numeric); p v046
o231 = Obj195.new
p(o231.kind_of?(Object))
v047 = o231.kind_of?(Object); p v047
# A ::-scoped class argument on a built-in receiver raises NoMethodError at runtime:
r050 = (5.kind_of?(::Integer) rescue $!.class); p r050

# Inheritance chain + module through a user class (kind_of? is an alias of is_a?)
module Runs195; end
class Vehicle195; end
class Car195 < Vehicle195
  include Runs195
end
c195 = Car195.new
p(c195.kind_of?(Car195))
k195 = c195.kind_of?(Car195); p k195
p(c195.kind_of?(Vehicle195))
k196 = c195.kind_of?(Vehicle195); p k196
p(c195.kind_of?(Runs195))
k197 = c195.kind_of?(Runs195); p k197
p(Vehicle195.new.kind_of?(Car195))
k198 = Vehicle195.new.kind_of?(Car195); p k198

# kind_of? is is_a? — true for every class and module in the ancestry
module Swims196; end
module Flies196; end
class Creature196; end
class Bird196 < Creature196; include Flies196; end
class Penguin196 < Bird196; include Swims196; end
p196 = Penguin196.new
p(p196.kind_of?(Penguin196))
v196 = p196.kind_of?(Penguin196); p v196
p(p196.kind_of?(Bird196))
p(p196.kind_of?(Creature196))
p(p196.kind_of?(Object))
p(p196.kind_of?(BasicObject))
p(p196.kind_of?(Swims196))
p(p196.kind_of?(Flies196))
w196 = p196.kind_of?(Flies196); p w196
# a sibling class and an unrelated module are not in the ancestry
class Fish196 < Creature196; include Swims196; end
p(p196.kind_of?(Fish196))
p(Bird196.new.kind_of?(Swims196))
w197 = Bird196.new.kind_of?(Swims196); p w197
# instance_of? is exact-class only, for contrast
p(p196.instance_of?(Bird196))
p(p196.instance_of?(Penguin196))
