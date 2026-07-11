# frozen_string_literal: true
class BO < BasicObject
  def initialize(x = 0)
    @x = x
  end
  def val
    @x
  end
end

# BasicObject.new
# A subclass of BasicObject is constructed normally (initialize runs).
a001 = BO.new(7); p(a001.val)
a002 = BO.new; p(a002.val)
a003 = BO.new(7); v001 = (a003.val); p v001
a004 = BO.new(3); b004 = BO.new(3); p(a004.equal?(b004))

# Instantiating BasicObject itself compiles but raises NameError at runtime under
# Spinel (the constant resolves fine as a superclass and in BasicObject.name).
# The instance is blank-slate and cannot be inspected, so probe via rescue.
r001 = begin
  BasicObject.new
  :created
rescue
  $!.class
end
p r001
