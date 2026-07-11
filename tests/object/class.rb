# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
  def to_s; "Obj-to-s"; end
  def inspect; "#<Obj-inspect>"; end
end

# Object#class
p(5.class)
v010 = 5.class; p v010
p("x".class)
v011 = "x".class; p v011
p([].class)
v012 = [].class; p v012
p(:a.class)
v013 = :a.class; p v013
p(nil.class)
v014 = nil.class; p v014
p((1..2).class)
v015 = (1..2).class; p v015
p((2**70).class)
v016 = (2**70).class; p v016
p(1.5.class)
p(true.class)
p(false.class)
p({}.class)
p((1r).class)
p((1i).class)
a016 = 1.5; p(a016.class)

module Mixin195; end
class Root195; end
class Leaf195 < Root195
  include Mixin195
end
# .class of a user object is its exact class; the chain is reachable from it
o017 = Leaf195.new
p(o017.class)
v017 = o017.class; p v017
p(o017.class.superclass)
v018 = o017.class.superclass; p v018
p(o017.class.ancestors.include?(Mixin195))
p(o017.class == Leaf195)
v019 = (o017.class == Leaf195); p v019
p(Root195.new.class)
