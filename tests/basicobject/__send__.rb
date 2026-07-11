# frozen_string_literal: true
class BO < BasicObject
  def initialize(x = 0)
    @x = x
  end
  def val
    @x
  end
  def bump(n)
    @x + n
  end
  def apply
    yield @x
  end
  private
  def secret
    @x * 2
  end
end

# BasicObject#__send__
# Invokes a method by (literal) name, including private and operator methods.
a001 = BO.new(7); p(a001.__send__(:val))
a002 = BO.new(7); v001 = (a002.__send__(:val)); p v001
a003 = BO.new(7); p(a003.__send__(:bump, 3))
a004 = BO.new(7); b004 = 3; p(a004.__send__(:bump, b004))
a005 = BO.new(7); v002 = (a005.__send__(:bump, 3)); p v002
a006 = BO.new; p(a006.__send__(:==, a006))
a007 = BO.new; b007 = BO.new; p(a007.__send__(:==, b007))
a008 = BO.new; p(a008.__send__(:__id__) == a008.__id__)
# __send__ reaches a private method (unlike public_send).
a009 = BO.new(6); p(a009.__send__(:secret))
a010 = BO.new(6); v003 = (a010.__send__(:secret)); p v003
# __send__ forwards a block to the invoked method.
a011 = BO.new(5); p(a011.__send__(:apply) { |n| n + 1 })
a012 = BO.new(5); v004 = (a012.__send__(:apply) { |n| n * 10 }); p v004

# Nested send-family dispatch by literal name works now (both use __send__, which a
# BasicObject has):
a013 = BO.new(7); p(a013.__send__(:__send__, :val))
a014 = BO.new(7); v005 = (a014.__send__(:__send__, :val)); p v005
# __send__(:send, ...) is different: a BasicObject has no #send, so Ruby raises
# NoMethodError; Spinel wrongly gives BO the full Object/Kernel table and returns the value.
a015 = BO.new(7); r005 = (a015.__send__(:send, :val) rescue $!.class); p r005
