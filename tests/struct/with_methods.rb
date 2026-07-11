# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Struct — with methods
Named = Struct.new(:a) do
  def double
    a * 2
  end
end
p(Named.new(3).double)
v010 = Named.new(3).double; p(v010)
n1 = Named.new(4); p(n1.double)
v011 = n1.double; p(v011)
