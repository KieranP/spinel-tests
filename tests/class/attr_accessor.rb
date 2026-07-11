# frozen_string_literal: true
class C001
  attr_accessor :x
  def initialize; @x = 1; end
end

# Class#attr_accessor (declarative, in class body)
o001 = C001.new
o001.x = 7
p(o001.x)
v001 = o001.x; p v001
# Calling attr_accessor at runtime with an explicit receiver is rejected:
# WONTFIX: See docs/limitations.md - "Fundamental limits — Runtime structural mutation of a class through an explicit receiver"
# C001.attr_accessor(:y)
# An accessor named after a String method, read inside a block
class BytesHolder
  attr_accessor :bytes
  def initialize(b); @bytes = b; end
end
[BytesHolder.new(10)].each { |c030| p c030.bytes }
v031 = [BytesHolder.new(10)].map { |c031| c031.bytes }; p v031
# the same read outside a block is correct
c032 = BytesHolder.new(10); p c032.bytes
# An accessor named after a String-RETURNING String method still resolves to that
# String method when read inside a block. Runtime value difference, so it stays live.
class UpcaseHolder
  attr_accessor :upcase
  def initialize(u); @upcase = u; end
end
[UpcaseHolder.new(10)].each { |c033| p c033.upcase }
v034 = [UpcaseHolder.new(10)].map { |c034| c034.upcase }; p v034
# the same read outside a block is correct
c035 = UpcaseHolder.new(10); p c035.upcase
# C build once a subclass stores self into that same accessor of another node.
class SelfLinked
  attr_accessor :nxt
  def initialize; @nxt = self; end
end
class SelfLinkedHead < SelfLinked
  def peek; c036 = nxt; c036.equal?(self); end
  def relink; nxt.nxt = self; end
end
c037 = SelfLinkedHead.new; p c037.peek
c038 = SelfLinkedHead.new; v039 = c038.peek; p v039
c040 = SelfLinkedHead.new; c040.relink; p c040.nxt.equal?(c040)

# A base class and its subclass sharing the same attr field in a circular ring. This form
# matches; the related compile abort (see bugs/20260816191940664_*.rb and
# samples/structures/dlx_exact_cover.rb, both tagged) only appears once the whole call graph
# makes the field genuinely hold both classes, so it is deliberately NOT tagged here.
class RingNode900
  attr_accessor :nxt
  def initialize = @nxt = self
end
class RingHead900 < RingNode900
  def walk900
    j900 = nxt
    j900 = j900.nxt while !j900.equal?(self)
    :done
  end
end
h900 = RingHead900.new; n900 = RingNode900.new
h900.nxt = n900; n900.nxt = h900
p h900.walk900

# receiver was stored through a parent-class accessor written inside a parent method
class NodeAA950
  attr_accessor :right
  def initialize
    @right = self
  end

  def link(other)
    other.right = self
    self
  end
end
class ColumnAA950 < NodeAA950
  attr_accessor :name
  def initialize(name)
    super()
    @name = name
  end
end
root950 = ColumnAA950.new("root")
ColumnAA950.new("a").link(root950)
p root950.right.name
v951 = root950.right.name; p v951
