# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Struct#[]=
Coll141 = Struct.new(:x, :y)
pt141a = Coll141.new(1, 2); pt141a[0] = 99; p(pt141a.x)
pt141c = Coll141.new(1, 2); pt141c[0] = 99; v013 = pt141c.x; p(v013)
pt141b = Coll141.new(1, 2); pt141b[:y] = 88; p(pt141b.y)
pt141d = Coll141.new(1, 2); pt141d[:y] = 88; v014 = pt141d.y; p(v014)
pt141e = Coll141.new(1, 2); pt141e[-1] = 77; p(pt141e.y)
pt141f = Coll141.new(1, 2); pt141f[-1] = 77; v034 = pt141f.y; p(v034)
# String key
pt141g = Coll141.new(1, 2); pt141g["x"] = 66; p(pt141g.x)
pt141h = Coll141.new(1, 2); pt141h["y"] = 55; v035 = pt141h.y; p(v035)
# the assignment expression evaluates to the assigned value
pt141i = Coll141.new(1, 2); v036 = (pt141i[0] = 44); p(v036)
# the value being written held in a variable, and a non-Integer member value
n037 = 33; pt141j = Coll141.new(1, 2); pt141j[1] = n037; p(pt141j.y)
Het038 = Struct.new(:a, :b)
h038 = Het038.new(1, "s"); h038[1] = "t"; p(h038.b)
h039 = Het038.new(1, "s"); h039[:a] = [7]; v039 = h039.a; p(v039)

# an index held in a local
S040 = Struct.new(:a, :b)
s040 = S040.new(1, 2); i040 = 1; s040[i040] = 9; p s040.b
# capturing the assigned value with a variable key aborts the C build
v040 = (s040[i040] = 7); p v040
# a literal index past the last member
S041 = Struct.new(:a, :b)
s041 = S041.new(1, 2)
r041 = (begin; s041[9] = 1; "no error"; rescue IndexError; "idx"; end); p r041
