# frozen_string_literal: true
# Kernel#instance_variable_get (literal ivar name)
class Foo451; def initialize; @x = 42; @y = "hi"; end; end
a451 = Foo451.new
p(a451.instance_variable_get(:@x))
v451 = a451.instance_variable_get(:@y); p v451

# a String name, an unset ivar, and a read from inside the object's own method
class Foo452
  def initialize; @a = 1; @b = [2]; end
  def get_sym; instance_variable_get(:@a); end
  def get_str; instance_variable_get("@a"); end
end
a452 = Foo452.new
p(a452.get_sym)
p(a452.get_str)
p(a452.instance_variable_get("@a"))
v452 = a452.instance_variable_get(:@b); p v452
