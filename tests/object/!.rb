# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
  def to_s; "Obj-to-s"; end
  def inspect; "#<Obj-inspect>"; end
end

# Object#!
p(!5)
v060 = !5; p v060
p(!nil)
v061 = !nil; p v061
p(!true)
v062 = !true; p v062
p(!false)
v063 = !false; p v063
p(!"x")
v064 = !"x"; p v064
p(![])
p(!!nil)
v065 = !!nil; p v065
a060 = nil; p(!a060)
# ! on a user object stored by value (ivar-bearing), with no user-defined #!
p(!Obj195.new)
p(not Obj195.new)
o060 = Obj195.new; v066 = !o060; p v066

# a user-defined #! should be dispatched by the ! operator
# value to a pointer, so the C build fails and takes the whole file down
class Neg195
  def initialize(b); @b = b; end
  def !; !@b; end
end
p(!Neg195.new(true))
p(!Neg195.new(false))
v067 = !Neg195.new(false); p v067
p(!!Neg195.new(false))
