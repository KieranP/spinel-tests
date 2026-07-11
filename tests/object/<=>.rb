# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
end

# Object#<=>
p(5 <=> 5)
v001 = (5 <=> 5); p v001
p(nil <=> nil)
p(nil <=> 5)
v002 = (nil <=> 5); p v002
# The default Object#<=> (0 for the same object, nil otherwise) on a user object is
# rejected before codegen:
o001 = Obj195.new; p(o001 <=> o001)
p(Obj195.new <=> Obj195.new)

# A user-defined <=> alongside a sibling method that reassigns its own parameter.
# The sibling is never called; defining it is enough.
class Spaceship196
  attr_reader :v
  def initialize(v)
    @v = v
  end

  def <=>(other)
    @v <=> other.v
  end

  def widen(other)
    other = Spaceship196.new(other) unless other.is_a?(Spaceship196)
    other.v
  end
end
p(Spaceship196.new(1) <=> Spaceship196.new(2))
v003 = (Spaceship196.new(2) <=> Spaceship196.new(1)); p v003

# A second user class defining a <=> that can return nil makes the ivar compare
# polymorphic, and the nil return then leaves the mrb_int result unboxed. The
# whole class must stay commented out: defining it aborts the build for
# Spaceship196 above as well as for itself.
# function with incompatible result type 'sp_RbVal'"
class Spaceship197
  attr_reader :v
  def initialize(v)
    @v = v
  end
#
  def <=>(other)
    return nil unless other.is_a?(Spaceship197)
#     @v <=> other.v
  end
end
p(Spaceship197.new(1) <=> Spaceship197.new(2))
v004 = (Spaceship197.new(1) <=> Spaceship197.new(2)); p v004
