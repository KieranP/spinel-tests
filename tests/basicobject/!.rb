# frozen_string_literal: true
class BO < BasicObject
  def initialize(x = 0)
    @x = x
  end
end

# BasicObject#!
# A blank-slate object is truthy, so ! is always false and !! always true.
a001 = BO.new; p(!a001)
a002 = BO.new; v001 = (!a002); p v001
a003 = BO.new; p(!!a003)
a004 = BO.new; v002 = (!!a004); p v002
a005 = BO.new; p((!a005).class)
a006 = BO.new; v003 = ((!a006).class); p v003
