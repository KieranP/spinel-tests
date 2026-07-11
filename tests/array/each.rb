# frozen_string_literal: true
# Array#each

p([1, 2, 3].each { |x| x })

a001 = [1, 2, 3]
p a001.class
p a001.each { |x| x }

a002 = [1, 2, 3]
c002 = a002.each { |x| x }
p c002.class
p c002

p([1.1, 2.2, 3.3].each { |x| x })

a003 = [1.1, 2.2, 3.3]
p a003.class
p a003.each { |x| x }

a004 = [1.1, 2.2, 3.3]
c004 = a004.each { |x| x }
p c004.class
p c004

p(["a", "b", "c"].each { |x| x })

a005 = ["a", "b", "c"]
p a005.class
p a005.each { |x| x }

a006 = ["a", "b", "c"]
c006 = a006.each { |x| x }
p c006.class
p c006

# no-block -> Enumerator (deterministic forms; avoid printing the raw object)
p([1, 2, 3].each.class)
p([1, 2, 3].each.to_a)

a007 = [10, 20, 30]
p a007.each.class
c007 = a007.each.to_a
p c007

# each with_index
r008 = []
[10, 20, 30].each.with_index { |x, i| r008 << [x, i] }
p r008

a009 = [10, 20, 30]
r009 = []
a009.each.with_index { |x, i| r009 << [x, i] }
p r009

# empty receiver
p([].each { |x| x })
p([].each.class)

a010 = []
c010 = a010.each { |x| x }
p c010

# each returns self
p(([1, 2, 3].each {}).equal?([1, 2, 3]))

a011 = [1, 2, 3]
p((a011.each {}).equal?(a011))

a012 = [1, 2, 3]
c012 = (a012.each {}).equal?(a012)
p c012

# A user-defined binary operator on the block parameter
class Money013
  attr_reader :cents
  def initialize(cents); @cents = cents; end
  def +(other); Money013.new(@cents + other.cents); end
  def /(n); Money013.new(@cents / n); end
  def %(n); Money013.new(@cents % n); end
  def <(other); @cents < other.cents; end
  def to_s; "$#{@cents}"; end
end
[Money013.new(250)].each { |m013| puts (m013 + Money013.new(50)).to_s }
[Money013.new(250)].each { |m014| puts (m014 / 5).to_s }
[Money013.new(250)].each { |m015| puts (m015 % 7).to_s }
v013 = []; [Money013.new(250)].each { |m017| v013 << (m017 / 5).to_s }; p v013
# parameter (rescue-wrapped so the raise does not truncate the file)
r013 = ([Money013.new(250)].each { |m016| p(m016 < Money013.new(300)) } && :ok rescue $!.class); p r013

# ill-typed C ("assigning to 'sp_IntArray *' from incompatible type 'sp_RbVal'")
class Bits014
  attr_reader :mask
  def initialize(mask); @mask = mask; end
  def <<(n); Bits014.new(@mask << n); end
  def to_s; "Bits(#{@mask})"; end
end
b014 = Bits014.new(5); puts (b014 << 2).to_s
# [Bits014.new(5)].each { |x014| puts (x014 << 2).to_s }
v014 = nil; [Bits014.new(5)].each { |y014| v014 = (y014 << 2).to_s }; p v014

# As a method's implicit return value this yields a zero value of the receiver's
# type instead of the receiver itself.
def ir805(x805); x805.each { |e805| nil }; end
p ir805([1, 2])
v805 = ir805([1, 2]); p v805
# control: the same call with the result consumed explicitly
def ic805(y805); return y805.each { |e805| nil }; end
p ic805([1, 2])

# the same iterator in the tail position of a BLOCK aborts the C build
# Kept commented: the compile abort takes down the whole file.
def by805; yield([1, 2]); end
p(by805 { |a815| a815.each { |e815| nil } })
w815 = by805 { |a816| a816.each { |e816| nil } }; p w815
# control: the same call with the result consumed inside the block
def bc805; yield([1, 2]); end
p(bc805 { |a817| r817 = a817.each { |e817| nil }; r817 })
u817 = bc805 { |a818| r818 = a818.each { |e818| nil }; r818 }; p u817

# A user-defined #join or #pack whose receiver is the each block parameter
class Box615
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def join(other) = Box615.new(@value + other.value)

  def pack(other) = Box615.new(@value + other.value)
end
[Box615.new(2)].each { |b615| p b615.join(Box615.new(3)).value }
w615 = nil; [Box615.new(2)].each { |c615| w615 = c615.join(Box615.new(3)).value }; p w615
[Box615.new(2)].each { |d615| p d615.pack(Box615.new(3)).value }
u615 = nil; [Box615.new(2)].each { |e615| u615 = e615.pack(Box615.new(3)).value }; p u615
