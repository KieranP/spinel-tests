# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
  def to_s; "Obj-to-s"; end
  def inspect; "#<Obj-inspect>"; end
  def x; @x; end
end

# Object#clone
p("abc".clone)
a020 = "abc"; b020 = a020.clone; p b020
p([1, 2].clone)
a021 = [1, 2]; b021 = a021.clone; p b021
a022 = "x".freeze; b022 = a022.clone; p b022.frozen?
a023 = "x".freeze; r197 = (a023.clone(freeze: false).frozen? rescue "NoMethodError"); p r197
o020 = Obj195.new; c020 = o020.clone; p c020.x
o021 = Obj195.new; c021 = o021.clone; p c021.equal?(o021)

class Bin195
  def initialize(a); @arr = a; @n = 0; end
  def arr; @arr; end
  def n; @n; end
  def n=(v); @n = v; end
end
# clone is a shallow copy too: the referenced array is shared
o024 = Bin195.new([1, 2]); c024 = o024.clone; c024.arr.push(3); p o024.arr
# clone DOES preserve frozen state (unlike dup)
o025 = Bin195.new([1]).freeze; c025 = o025.clone; p c025.frozen?
v025 = Bin195.new([1]).freeze.clone.frozen?; p v025
# clone(freeze: false) drops the frozen state
o026 = Bin195.new([1]).freeze; c026 = o026.clone(freeze: false); p c026.frozen?
v026 = Bin195.new([1]).freeze.clone(freeze: false).frozen?; p v026
# clone(freeze: true) on an unfrozen object freezes the copy
o027 = Bin195.new([1]); c027 = o027.clone(freeze: true); p c027.frozen?

# clone DOES carry the receiver's singleton methods (unlike dup)
class Sing196; def base; 1; end; end
o040 = Sing196.new
def o040.extra; 99; end
c040 = o040.clone; v040 = c040.extra; p v040
p o040.clone.extra
p o040.clone.base

# initialize_copy runs for clone too
class Deep196
  attr_accessor :items
  def initialize; @items = [1, 2]; end
  def initialize_copy(src); super; @items = src.items.dup; end
end
o041 = Deep196.new; c041 = o041.clone; c041.items.push(3); p o041.items; p c041.items
v041 = Deep196.new.clone; v041.items.push(9); p v041.items

# a hand-written initialize_copy that ignores super still runs
class Cnt196
  attr_reader :n
  def initialize; @n = 0; end
  def initialize_copy(src); @n = src.n + 100; end
end
p(Cnt196.new.clone.n)
v042 = Cnt196.new.clone; p v042.n
