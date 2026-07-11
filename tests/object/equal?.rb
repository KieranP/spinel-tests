# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
  def to_s; "Obj-to-s"; end
  def inspect; "#<Obj-inspect>"; end
end

# Object#equal?
a040 = "x"; p a040.equal?(a040)
a041 = "x"; v020 = a041.equal?(a041); p v020
# WONTFIX: See docs/limitations.md - "By design — String#equal? and shared literals"
# p("x".equal?("x"))
p(5.equal?(5))
p(:a.equal?(:a))
r195a = (nil.equal?(nil) rescue "NoMethodError"); p r195a
r195b = (true.equal?(true) rescue "NoMethodError"); p r195b

class Ref195
  def initialize; @x = 1; end
end
# equal? is identity even for user objects: only the same object is equal?
o060 = Ref195.new; p o060.equal?(o060)
v060 = o060.equal?(o060); p v060
o061 = Ref195.new; o062 = Ref195.new; p o061.equal?(o062)
v061 = o061.equal?(o062); p v061
# a copy is a distinct object
o063 = Ref195.new; p o063.equal?(o063.dup)
o064 = Ref195.new; o065 = o064; p o064.equal?(o065)
