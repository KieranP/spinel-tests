# frozen_string_literal: true
class BO < BasicObject
  def initialize(x = 0)
    @x = x
  end
  def val
    @x
  end
end

# BasicObject#instance_eval
# Block form: evaluates the block with self and instance-variable scope set to
# the receiver. Works on user-defined objects.
a001 = BO.new(7); p(a001.instance_eval { @x })
a002 = BO.new(7); v001 = (a002.instance_eval { @x }); p v001
a003 = BO.new(7); p(a003.instance_eval { val })
a004 = BO.new(7); v002 = (a004.instance_eval { val + 1 }); p v002
# The block receives the receiver as its argument, and self is that receiver.
a005 = BO.new; p(a005.instance_eval { |obj| obj.equal?(a005) })
a006 = BO.new(7); v003 = (a006.instance_eval { |obj| obj.__send__(:val) }); p v003
a007 = BO.new(7); p(a007.instance_eval { self.__id__ == a007.__id__ })
# The block can read and mutate the receiver's instance variables.
a008 = BO.new(1); a008.instance_eval { @x = 50 }; p(a008.val)
a009 = BO.new(0); a009.instance_eval { @y = 9 }; p(a009.instance_eval { @y })
# instance_eval returns the block's value.
a010 = BO.new(3); v004 = (a010.instance_eval { val * val }); p v004

# On a built-in receiver the block form now works too (evaluated against the receiver).
p("abc".instance_eval { upcase })
r001 = "abc".instance_eval { upcase }; p r001
p(5.instance_eval { self + 1 })
p([1, 2, 3].instance_eval { size })
# instance_eval in a rescue modifier: both a non-raising block and one that raises are
# handled correctly (the raising block's TypeError is caught -> $!.class).
r002 = ("abc".instance_eval { upcase } rescue $!.class); p r002
r003 = ("ab".instance_eval { self + 2 } rescue $!.class); p r003

# nil is the one built-in receiver whose block form diverges: Spinel raises a
# (rescuable) NoMethodError instead of evaluating the block against nil.
r004 = (nil.instance_eval { 42 } rescue $!.class); p r004

# String-argument (eval) form is a documented, deliberate limitation:
# WONTFIX: See docs/limitations.md - "Fundamental limits — eval / instance_eval('str') / class_eval('str')"
# a011 = BO.new(7); p(a011.instance_eval("@x"))
