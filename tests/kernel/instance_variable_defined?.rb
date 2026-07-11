# frozen_string_literal: true
# Kernel#instance_variable_defined?
class Foo471; def initialize; @x = 1; end; end
a471 = Foo471.new
p(a471.instance_variable_defined?(:@x))
p(a471.instance_variable_defined?(:@z))
v471 = a471.instance_variable_defined?(:@x); p v471

# a String name, and the query from inside the object's own method
class Foo472
  def initialize; @x = 1; end
  def has_x; instance_variable_defined?(:@x); end
  def has_z; instance_variable_defined?(:@z); end
end
a472 = Foo472.new
p(a472.has_x)
p(a472.has_z)
p(a472.instance_variable_defined?("@x"))
v472 = a472.instance_variable_defined?("@z"); p v472
