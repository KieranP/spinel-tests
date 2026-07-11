# frozen_string_literal: true
# Kernel#instance_variable_set (literal ivar name, already declared on the class)
class Foo461; def initialize; @x = 1; end; def x; @x; end; end
a461 = Foo461.new
a461.instance_variable_set(:@x, 100)
p(a461.x)
v461 = a461.instance_variable_set(:@x, 200); p v461
# Setting an ivar not present anywhere at compile time has no struct offset:
# a462 = Foo461.new; a462.instance_variable_set(:@brandnew, 5); p(a462.instance_variable_get(:@brandnew))
# WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"

# a String name, and a set from inside the object's own method
class Foo462
  def initialize; @x = 1; end
  def x; @x; end
  def bump; instance_variable_set(:@x, @x + 1); end
end
a462 = Foo462.new
a462.bump
p(a462.x)
a462.instance_variable_set("@x", 50)
p(a462.x)
v462 = a462.instance_variable_set(:@x, 60); p v462
p(a462.x)
