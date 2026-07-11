# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
  def to_s; "Obj-to-s"; end
  def inspect; "#<Obj-inspect>"; end
end

# Object#==
p(5 == 5)
v001 = (5 == 5); p v001
p(5 == 6)
v002 = (5 == 6); p v002
p("x" == "x")
v003 = ("x" == "x"); p v003
p([1, 2] == [1, 2])
v004 = ([1, 2] == [1, 2]); p v004
p(:a == :a)
v005 = (:a == :a); p v005
a010 = 5; b010 = 5; p(a010 == b010)
p(nil == nil)
v006 = (nil == nil); p v006
p(5 == 5.0)
p(5 == "5")
p(:a == "a")
p(true == true)
p(true == false)
o010 = Obj195.new; p(o010 == o010)
p(Obj195.new == Obj195.new)

# default == is identity: same object true, distinct objects false
o011 = Obj195.new; v007 = (o011 == o011); p v007
o012 = Obj195.new; o013 = Obj195.new; v008 = (o012 == o013); p v008

# a user-defined == compares by value
class Money195
  attr_reader :cents
  def initialize(c); @cents = c; end
  def ==(other); other.is_a?(Money195) && cents == other.cents; end
end
p(Money195.new(100) == Money195.new(100))
v009 = (Money195.new(100) == Money195.new(100)); p v009
p(Money195.new(100) == Money195.new(200))
a011 = Money195.new(50); b011 = Money195.new(50); p(a011 == b011)
p(Money195.new(100) == "100")
p(Money195.new(100) == 100)

# a user-defined == is what Array#include? / #index / #uniq / #delete consult
class Coin196
  attr_reader :v
  def initialize(v); @v = v; end
  def ==(o); o.is_a?(Coin196) && v == o.v; end
  def inspect; "C#{v}"; end
end
a020 = Coin196.new(1); b020 = Coin196.new(1); c020 = Coin196.new(2)
p([a020, c020].include?(b020))
v020 = [a020, c020].include?(b020); p v020
p([a020, c020].index(b020))
v021 = [a020, c020].index(c020); p v021
p([a020, c020].include?(Coin196.new(9)))
p([a020, b020, c020].count(b020))
d020 = [a020, b020, c020]; d020.delete(b020); p d020

# == across an inheritance chain, and == against an unrelated type
class Sub196 < Coin196; end
p(Coin196.new(1) == Sub196.new(1))
v022 = (Sub196.new(1) == Coin196.new(1)); p v022
p(Coin196.new(1) == 1)
p(Coin196.new(1) == nil)
