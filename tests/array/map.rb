# frozen_string_literal: true
# Array#map
p([1, 2, 3].map { |n| n * 2 })

a001 = [1, 2, 3]
p a001.class
p a001.map { |n| n * 2 }

a002 = [1, 2, 3]
c002 = a002.map { |n| n * 2 }
p c002.class
p c002

p([1.1, 2.2, 3.3].map { |n| n * 2 })

a003 = [1.1, 2.2, 3.3]
p a003.class
p a003.map { |n| n * 2 }

a004 = [1.1, 2.2, 3.3]
c004 = a004.map { |n| n * 2 }
p c004.class
p c004

p(["a", "b", "c"].map { |n| n * 2 })

a005 = ["a", "b", "c"]
p a005.class
p a005.map { |n| n * 2 }

a006 = ["a", "b", "c"]
c006 = a006.map { |n| n * 2 }
p c006.class
p c006

# no-block -> Enumerator (deterministic forms)
p([1, 2, 3].map.class)
p([1, 2, 3].map.to_a)

a007 = [1, 2, 3]
p a007.map.class
c007 = a007.map.to_a
p c007

# map.with_index
p([10, 20, 30].map.with_index { |x, i| x + i })

a008 = [10, 20, 30]
c008 = a008.map.with_index { |x, i| x + i }
p c008

# empty receiver
p([].map { |x| x * 2 })

a009 = []
c009 = a009.map { |x| x * 2 }
p c009

# map to a different type
p([1, 2, 3].map { |x| x.to_s })

a010 = [1, 2, 3]
c010 = a010.map { |x| x.to_s }
p c010

p([1, 2, 3].map { |x| x.even? })

a011 = [1, 2, 3]
c011 = a011.map { |x| x.even? }
p c011

def rect768(width:, height:) = width * height
cfg768 = [{ width: 2, height: 3 }, { width: 5, height: 5 }]
p cfg768.map { |c768| rect768(**c768) }

def tf069(str); num, den = str.split("/").map(&:to_i); Rational(num, den || 1); end
ex069 = [["1/2", "+", "1/3"]]
ex069.each { |a, op, b| p tf069(a) }
p ex069.map { |a, _, _| tf069(a) }.inject(Rational(0), :+)

# an unused element parameter on an empty Array literal
p([].map { |x933| 1 })
v934 = [].map { |x934| 1 }; p v934
# Control: the parameter used, and a local-variable receiver.
p([].map { |x935| x935 * 2 })
a936 = []
p(a936.map { |x936| 1 })

# A user-defined #join whose receiver is the map block parameter
class Box610
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def join(other) = Box610.new(@value + other.value)
end
p([Box610.new(2), Box610.new(3)].map { |b610| b610.join(Box610.new(1)).value })
w610 = [Box610.new(2)].map { |c610| c610.join(Box610.new(1)).value }; p w610

# A user-defined #pack whose receiver is the map block parameter
class Crate613
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def pack(other) = Crate613.new(@value + other.value)
end
p([Crate613.new(2), Crate613.new(3)].map { |c613| c613.pack(Crate613.new(1)).value })
w613 = [Crate613.new(2)].map { |d613| d613.pack(Crate613.new(1)).value }; p w613
