# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Point.name
p(Point.name)
v043 = Point.name; p v043

# An anonymous Struct class has no name in CRuby. Runtime value difference, so
# these stay live.
p(Struct.new(:z).name)
k044 = Struct.new(:z); v044 = k044.name; p v044

# a Struct subclass written with the Struct.new inline reports its own constant
class Named045 < Struct.new(:a)
end
p(Named045.name)
v045 = Named045.name; p v045
