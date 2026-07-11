# frozen_string_literal: true
class Widget001
  def initialize; @x = 1; end
  def x; @x; end
end

# Class#allocate
p(Widget001.allocate.class)
v001 = Widget001.allocate; p v001.class
# allocate does not call initialize, so @x stays nil
p(Widget001.allocate.x)
v002 = Widget001.allocate; p v002.x
# allocate on a builtin class -> unsupported reject
p(String.allocate)
v003 = String.allocate; p v003
# allocate through a variable-held class reference -> unsupported reject
w001 = Widget001
p(w001.allocate.class)
