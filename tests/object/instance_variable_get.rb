# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
  def to_s; "Obj-to-s"; end
  def inspect; "#<Obj-inspect>"; end
end

# Object#instance_variable_get
a073 = Obj195.new; p a073.instance_variable_get('@x')
a074 = Obj195.new; v038 = a074.instance_variable_get('@x'); p v038
# symbol literal name form
a075 = Obj195.new; p a075.instance_variable_get(:@x)
a076 = Obj195.new; v039 = a076.instance_variable_get(:@x); p v039
# an unset ivar reads as nil
a077 = Obj195.new; p a077.instance_variable_get(:@missing195).inspect
a078 = Obj195.new; v040 = a078.instance_variable_get(:@missing195); p v040.nil?
# WONTFIX: See docs/limitations.md - "Fundamental limits (inherent to AOT)" (instance_variable_get with a non-literal name)
# a079 = Obj195.new; nm079 = :@x; p a079.instance_variable_get(nm079)
