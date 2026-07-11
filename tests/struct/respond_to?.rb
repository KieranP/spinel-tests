# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Point#respond_to?
p(Point.new(1, 2).respond_to?(:x))
p(Point.new(1, 2).respond_to?(:definitely_not_a_method_xyz))
a020 = Point.new(1, 2); p(a020.respond_to?(:x))
a021 = Point.new(1, 2); v021 = a021.respond_to?(:definitely_not_a_method_xyz); p v021
