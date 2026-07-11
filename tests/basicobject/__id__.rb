# frozen_string_literal: true
class BO < BasicObject
  def initialize(x = 0)
    @x = x
  end
end

# BasicObject#__id__
# Each object has a stable integer id; distinct objects get distinct ids.
a001 = BO.new; p(a001.__id__ == a001.__id__)
a002 = BO.new; v001 = (a002.__id__ == a002.__id__); p v001
a003 = BO.new; b003 = BO.new; p(a003.__id__ == b003.__id__)
a004 = BO.new; b004 = a004; p(a004.__id__ == b004.__id__)
a005 = BO.new; p(a005.__id__.is_a?(Integer))
a006 = BO.new; v002 = (a006.__id__.class); p v002
