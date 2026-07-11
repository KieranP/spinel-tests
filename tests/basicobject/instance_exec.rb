# frozen_string_literal: true
class BO < BasicObject
  def initialize(x = 0)
    @x = x
  end
  def val
    @x
  end
end

# BasicObject#instance_exec
# Like instance_eval, but passes its arguments to the block. Works on user objects.
a001 = BO.new(7); p(a001.instance_exec(3) { |y| @x + y })
a002 = BO.new(7); v001 = (a002.instance_exec(3) { |y| @x + y }); p v001
a003 = BO.new(7); b003 = 3; p(a003.instance_exec(b003) { |y| @x + y })
a004 = BO.new(7); p(a004.instance_exec { @x })
a005 = BO.new(1); p(a005.instance_exec(2, 3) { |a, b| @x + a + b })
a006 = BO.new(7); v002 = (a006.instance_exec(10) { |y| val + y }); p v002
# Arguments can be splatted from an array.
a007 = BO.new(1); args001 = [2, 3]; p(a007.instance_exec(*args001) { |x, y| @x + x + y })
a008 = BO.new(1); args002 = [4, 5]; v003 = (a008.instance_exec(*args002) { |x, y| @x + x + y }); p v003
# The block can mutate the receiver's instance variables.
a009 = BO.new(0); a009.instance_exec(9) { |n| @x = n }; p(a009.val)
# self inside the block is the receiver.
a010 = BO.new; p(a010.instance_exec { self.equal?(a010) })

# On a built-in receiver the block form now works too.
p("ab".instance_exec("c") { |s| self + s })
r001 = "ab".instance_exec("c") { |s| self + s }; p r001
p(5.instance_exec(2) { |n| self + n })
p([1, 2].instance_exec(0) { |n| size + n })
# An instance_exec block that raises, wrapped in a rescue modifier, is routed to the
# modifier correctly (the block raises TypeError on String + Integer, caught -> $!.class).
r002 = ("ab".instance_exec(2) { |n| self + n } rescue $!.class); p r002

# nil receiver diverges: Spinel raises a (rescuable) NoMethodError instead of
# running the block against nil.
r003 = (nil.instance_exec(5) { |y| y } rescue $!.class); p r003
# A splat block parameter drops instance_exec's arguments (Spinel returns nil / an
# empty splat) where Ruby collects them into the splat variable.
a011 = BO.new(0); p(a011.instance_exec(1, 2, 3) { |*xs| xs })
a012 = BO.new(0); v004 = (a012.instance_exec(2, 3) { |first, *rest| [first, rest] }); p v004
