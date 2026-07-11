# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Struct — writer
pt3 = Point.new(1, 2); pt3.x = 9; p(pt3.x)
v006 = pt3.x; p(v006)
pt4 = Point.new(1, 2); pt4.y = 8; p([pt4.x, pt4.y])
v007 = [pt4.x, pt4.y]; p(v007)
# the writer returns the assigned value, and accepts a value from a variable
pt5 = Point.new(1, 2); v008 = (pt5.x = 7); p(v008)
n009 = 6; pt6 = Point.new(1, 2); pt6.y = n009; p(pt6.y)
# writing a container, a String and nil
Het010 = Struct.new(:a, :b)
h010 = Het010.new(1, "s"); h010.b = "t"; p(h010.b)
h011 = Het010.new(1, "s"); h011.a = [7, 8]; v011 = h011.a; p(v011)
h012 = Het010.new(1, "s"); h012.b = nil; p(h012.to_a)
# op-assign through the writer
pt7 = Point.new(1, 2); pt7.x += 10; p(pt7.x)
pt8 = Point.new(1, 2); pt8.y *= 3; v013 = pt8.y; p(v013)
# writing through an element of an Array of Structs
arr014 = [Point.new(1, 2), Point.new(3, 4)]
arr014[1].y = 40; p(arr014.map { |e| e.y })
arr014.each { |e| e.x += 100 }; v014 = arr014.map { |e| e.x }; p(v014)
