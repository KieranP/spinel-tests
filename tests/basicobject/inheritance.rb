# frozen_string_literal: true
class BOA < BasicObject
  def initialize(x); @x = x; end
  def val; @x; end
  def tag; "A"; end
end
class BOB < BOA
  def initialize(x, y); super(x); @y = y; end
  def y; @y; end
  def tag; "B(" + super + ")"; end
end

# BasicObject — a subclass chain rooted at BasicObject
# super in initialize and in an ordinary method both reach the parent
a001 = BOB.new(1, 2)
p(a001.val)
v001 = a001.val; p v001
p(a001.y)
v002 = a001.y; p v002
p(a001.tag)
v003 = a001.tag; p v003
p(BOA.new(7).tag)

# the ancestry stops at BasicObject: no Object, no Kernel
p(BOB.superclass)
v004 = BOB.superclass; p v004
p(BOA.superclass)
p(BOB.ancestors)
v005 = BOB.ancestors; p v005
p(BOB.ancestors.include?(::Kernel))

# the eight BasicObject methods still work on a two-deep subclass
p(a001.equal?(a001))
v006 = a001.equal?(BOB.new(1, 2)); p v006
p(a001.__send__(:tag))
v007 = a001.__send__(:val); p v007
p(a001.__id__.is_a?(::Integer))
p(!a001)
# everything Object/Kernel provides is still absent
r001 = (a001.class rescue $!.class); p r001
r002 = (a001.inspect rescue $!.class); p r002
