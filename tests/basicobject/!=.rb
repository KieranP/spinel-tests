# frozen_string_literal: true
class BO < BasicObject
  def initialize(x = 0)
    @x = x
  end
end

class BOeq < BasicObject
  # != is defined in terms of ==, so overriding == flips != too.
  def ==(other)
    true
  end
end

# BasicObject#!=
# Default != is the negation of identity ==.
a001 = BO.new; p(a001 != a001)
a002 = BO.new; v001 = (a002 != a002); p v001
a003 = BO.new; b003 = BO.new; p(a003 != b003)
a004 = BO.new; b004 = BO.new; v002 = (a004 != b004); p v002
a005 = BO.new; b005 = a005; p(a005 != b005)
a006 = BO.new; p(a006 != 5)
a007 = BO.new; v003 = (a007 != nil); p v003

# When == always returns true, != always returns false for the same class.
c001 = BOeq.new; d001 = BOeq.new; p(c001 != d001)
c002 = BOeq.new; v004 = (c002 != d001); p v004
c003 = BOeq.new; p(c003 != 5)
