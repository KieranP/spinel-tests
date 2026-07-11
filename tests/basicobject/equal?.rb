# frozen_string_literal: true
class BO < BasicObject
  def initialize(x = 0)
    @x = x
  end
end

# BasicObject#equal?
# True object identity — cannot be overridden, one object equals only itself.
a001 = BO.new; p(a001.equal?(a001))
a002 = BO.new; v001 = (a002.equal?(a002)); p v001
a003 = BO.new; b003 = BO.new; p(a003.equal?(b003))
a004 = BO.new; b004 = BO.new; v002 = (a004.equal?(b004)); p v002
a005 = BO.new; b005 = a005; p(a005.equal?(b005))
a006 = BO.new; b006 = a006; v003 = (a006.equal?(b006)); p v003
a007 = BO.new; p(a007.equal?(5))
a008 = BO.new; v004 = (a008.equal?(nil)); p v004
