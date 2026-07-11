# frozen_string_literal: true
Point = Data.define(:x, :y)

# Data#respond_to?
p(Point.new(1, 2).respond_to?(:x))
v001 = Point.new(1, 2).respond_to?(:x); p v001
p(Point.new(1, 2).respond_to?(:definitely_not_a_method_xyz))
v002 = Point.new(1, 2).respond_to?(:definitely_not_a_method_xyz); p v002
# these inherited Data methods are reported correctly
p(Point.new(1, 2).respond_to?(:to_h))
p(Point.new(1, 2).respond_to?(:inspect))
# these inherited Data instance methods work when called directly, but respond_to? is false
p(Point.new(1, 2).respond_to?(:with))
p(Point.new(1, 2).respond_to?(:members))
a003 = Point.new(1, 2); p(a003.respond_to?(:deconstruct))
v003 = Point.new(1, 2).respond_to?(:deconstruct_keys); p v003
