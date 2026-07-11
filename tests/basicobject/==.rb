# frozen_string_literal: true
class BO < BasicObject
  def initialize(x = 0)
    @x = x
  end
  def val
    @x
  end
end

class BOeq < BasicObject
  def ==(other)
    true
  end
end

# BasicObject#==
# Default == is identity: true only for the very same object.
a001 = BO.new; p(a001 == a001)
a002 = BO.new; v001 = (a002 == a002); p v001
a003 = BO.new; b003 = BO.new; p(a003 == b003)
a004 = BO.new; b004 = BO.new; v002 = (a004 == b004); p v002
a005 = BO.new; b005 = a005; p(a005 == b005)
a006 = BO.new; v003 = (a006 == a006); p v003
# Comparing a blank-slate object to another type is false, never an error.
a007 = BO.new; p(a007 == 5)
a008 = BO.new; v004 = (a008 == nil); p v004

# A subclass may override == with its own semantics.
c001 = BOeq.new; d001 = BOeq.new; p(c001 == d001)
c002 = BOeq.new; v005 = (c002 == 5); p v005
