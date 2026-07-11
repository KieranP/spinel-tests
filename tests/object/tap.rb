# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
  def to_s; "Obj-to-s"; end
  def inspect; "#<Obj-inspect>"; end
end

# Object#tap
p(5.tap { |x| x })
v053 = 5.tap { |x| x }; p v053
p([1, 2].tap { |a| a.push(3) })
a080 = [1, 2]; a080.tap { |a| a.push(3) }; p a080
p(nil.tap { |x| x }.inspect)
v082 = nil.tap { |x| x }.inspect; p v082

class Counter195
  def initialize; @c = 0; end
  def bump; @c += 1; self; end
  def c; @c; end
end
# tap yields self, returns self (not the block value)
o083 = Counter195.new; p o083.tap { |x| x.bump }.c
o084 = Counter195.new; r084 = o084.tap { |x| x.bump }; p r084.equal?(o084)
o085 = Counter195.new; v085 = o085.tap { |x| x.bump; 99 }; p v085.c
o086 = Counter195.new; p o086.tap { |x| x.bump }.tap { |x| x.bump }.c
