# frozen_string_literal: true
Point = Data.define(:x, :y)

# Data#to_s
p(Point.new(1, 2).to_s)
a001 = Point.new(1, 2); p(a001.to_s)
a002 = Point.new(1, 2); v002 = a002.to_s; p v002
# to_s is what string interpolation uses
p("#{Point.new(3, 4)}")
v003 = "#{Point.new(3, 4)}"; p v003
# heterogeneous and nested members
Mixed004 = Data.define(:s, :n, :arr)
p(Mixed004.new("hi", 7, [1, 2]).to_s)
v004 = Mixed004.new("hi", 7, [1, 2]).to_s; p v004
Outer005 = Data.define(:inner, :label)
p(Outer005.new(Point.new(1, 2), "top").to_s)
v005 = Outer005.new(Point.new(1, 2), "top").to_s; p v005
# a member-less Data class
Empty006 = Data.define
p(Empty006.new.to_s)
v006 = Empty006.new.to_s; p v006
# to_s overridden in the define block
Named007 = Data.define(:a) do
  def to_s = "N(#{a})"
end
p(Named007.new(5).to_s)
p("#{Named007.new(5)}")
v007 = Named007.new(5).to_s; p v007
