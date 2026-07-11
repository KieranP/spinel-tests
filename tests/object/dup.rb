# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
  def to_s; "Obj-to-s"; end
  def inspect; "#<Obj-inspect>"; end
  def x; @x; end
end

# Object#dup
p("abc".dup)
a030 = "abc"; b030 = a030.dup; p b030
p([1, 2].dup)
a031 = [1, 2]; b031 = a031.dup; p b031
a032 = "x".freeze; b032 = a032.dup; p b032.frozen?
o030 = Obj195.new; d030 = o030.dup; p d030.x
o031 = Obj195.new; d031 = o031.dup; p d031.equal?(o031)

class Box195
  def initialize(a); @arr = a; @n = 0; end
  def arr; @arr; end
  def n; @n; end
  def n=(v); @n = v; end
end
# dup is a shallow copy: the referenced array is shared
o033 = Box195.new([1, 2]); d033 = o033.dup; d033.arr.push(3); p o033.arr
# but the copy's own ivar slot is independent
o034 = Box195.new([1]); d034 = o034.dup; d034.n = 9; p o034.n
o035 = Box195.new([1]); d035 = o035.dup; d035.n = 9; p d035.n
# dup does NOT preserve frozen state
o036 = Box195.new([1]).freeze; d036 = o036.dup; p d036.frozen?
v036 = Box195.new([1]).freeze.dup.frozen?; p v036

# should not have it; the copy's own respond_to? still answers false
class Sing195; def base; 1; end; end
o037 = Sing195.new
def o037.extra; 99; end
p o037.extra
p o037.dup.base
r195d = (o037.dup.extra rescue $!.class); p r195d
d038 = o037.dup
p d038.respond_to?(:extra)
p o037.clone.extra
r195e = (d038.extra rescue $!.class); p r195e

# initialize_copy runs on the new object and can deepen the copy
class Deep195
  attr_accessor :items
  def initialize; @items = [1, 2]; end
  def initialize_copy(src); super; @items = src.items.dup; end
end
o039 = Deep195.new; d039 = o039.dup; d039.items.push(3); p o039.items; p d039.items
v039 = Deep195.new.dup; v039.items.push(9); p v039.items
