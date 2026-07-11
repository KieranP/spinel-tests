# frozen_string_literal: true
# Array#reduce

p [].reduce { |a, b| a + b }
v090a = [].reduce { |a, b| a + b }; p v090a
p [].reduce(5) { |a, b| a + b }
v090b = [].reduce(5) { |a, b| a + b }; p v090b

p([1, 2, 3, 4].reduce(:+))

a001 = [1, 2, 3, 4]
p a001.class
p a001.reduce(:+)

a003 = [1, 2, 3, 4]
c003 = a003.reduce(:+)
p c003.class
p c003

p([1.1, 2.2, 3.3, 4.4].reduce(:+))

a004 = [1.1, 2.2, 3.3, 4.4]
p a004.class
p a004.reduce(:+)

a006 = [1.1, 2.2, 3.3, 4.4]
c006 = a006.reduce(:+)
p c006.class
p c006

p(["a", "b", "c"].reduce(:+))

a007 = ["a", "b", "c"]
p a007.class
p a007.reduce(:+)

a009 = ["a", "b", "c"]
c009 = a009.reduce(:+)
p c009.class
p c009

# reduce(init, :sym)
p([1, 2, 3].reduce(10, :+))
a010 = [1, 2, 3]
c010 = a010.reduce(10, :+)
p c010.class
p c010

# block without symbol
p([1, 2, 3].reduce { |a, b| a + b })
a011 = [1, 2, 3]
c011 = a011.reduce { |x, y| x + y }
p c011

# reduce(init) { block }
p([1, 2, 3].reduce(10) { |a, b| a + b })
a012 = [1, 2, 3]
c012 = a012.reduce(10) { |x, y| x + y }
p c012

# inject alias, symbol only
p([1, 2, 3].inject(:+))
a013 = [1, 2, 3]
c013 = a013.inject(:+)
p c013

# inject(init, :sym)
p([1, 2, 3].inject(10, :+))
a014 = [1, 2, 3]
c014 = a014.inject(10, :+)
p c014

# empty with no init -> nil
p([].reduce(:+))
a015 = []
c015 = a015.reduce(:+)
p c015

# empty with init -> init (direct literal form works)
p([].reduce(5, :+))
a016 = []
c016 = a016.reduce(5, :+)
p c016

# string concat with init
p(["a", "b", "c"].reduce("x", :+))
a017 = ["a", "b", "c"]
c017 = a017.reduce("x", :+)
p c017

p [1.0, 2.0].reduce(0, :+)
v921 = [1.0, 2.0].reduce(0, :+); p v921
p [Complex(1, 1)].inject(Complex(0, 0), :+)
v922 = [Complex(1, 1)].inject(Complex(0, 0), :+); p v922
p [Rational(1, 2), Rational(1, 4)].reduce(0, :+)
v923 = [Rational(1, 2), Rational(1, 4)].reduce(0, :+); p v923
p [2, -3].inject(0) { |a924, c924| a924 + Rational(1, 2) }

def reducer977(state, action)
  case action
  in { type: :inc, by: }
    state.merge(count: state[:count] + by)
  else
    state
  end
end
actions977 = [{ type: :inc, by: 5 }]
final977 = actions977.reduce({ count: 0 }) { |s, a| reducer977(s, a) }
p final977[:count]
# history977 = actions977.each_with_object([{ count: 0 }]) { |action, acc| acc << reducer977(acc.last, action) }
# p history977.length

# An explicit nil seed types the accumulator as C `void`.
# Kept commented: the compile abort takes down the whole file.
p [1, 2, 3].reduce(nil) { |acc586, t586| acc586.nil? ? t586 : t586 + acc586 }
v586 = [1, 2, 3].reduce(nil) { |b586, u586| b586.nil? ? u586 : b586 + u586 }; p v586
p ["a", "b"].reduce(nil) { |c586, w586| c586.nil? ? w586 : c586 + w586 }

# symbol, init+symbol, block and init+block forms
g881 = [1, 2, 3, 4]
p g881.reduce(:+)
v881 = g881.reduce(:+); p v881
p g881.reduce(100, :-)
v882 = g881.reduce(100, :-); p v882
p g881.reduce { |s883, x883| s883 * x883 }
v883 = g881.reduce { |s884, x884| s884 * x884 }; p v883
p g881.reduce(2) { |s885, x885| s885 * x885 }
v885 = g881.reduce(2) { |s886, x886| s886 * x886 }; p v885
s887 = :+
p g881.reduce(s887)
v887 = g881.reduce(0, s887); p v887
g888 = []
p g888.reduce(:+)
p g888.reduce(0, :+)
v888 = g888.reduce { |s889, x889| s889 + x889 }; p v888
g890 = ["a", "b", "c"]
p g890.reduce(:+)
v890 = g890.reduce("z", :+); p v890

# an Array accumulator over an Array of Arrays
g891 = [[1, 2], [3, 4]]
p g891.reduce(:+)
p g891.reduce([]) { |a892, r892| a892.concat(r892) }
p([[1, 2], [3, 4]].reduce([]) { |a893, r893| a893 + r893 })
g894 = [[1, 2], [3, 4]]; p g894.reduce([]) { |a894, r894| a894 + r894 }
g895 = [[1, 2], [3, 4]]; v895 = g895.reduce([0]) { |a895, r895| a895 + r895 }; p v895

# Array#& / Array#| as the fold operator, over an Array of Arrays
g896 = [[1, 2], [2, 3]]; p g896.reduce { |a896, r896| a896 & r896 }
g897 = [[1, 2], [2, 3]]; v897 = g897.reduce { |a897, r897| a897 & r897 }; p v897
g898 = [[1, 2], [2, 3]]; p g898.reduce { |a898, r898| a898 | r898 }
g899 = [[1, 2], [2, 3]]; v899 = g899.reduce { |a899, r899| a899 | r899 }; p v899

# user-defined type whose operator has no other call site in the program
class RFix960
  attr_reader :units
  def initialize(u) = @units = u
  def ^(other) = RFix960.new(units + other.units)
  def to_s = units.to_s
end
g960 = [RFix960.new(1), RFix960.new(2)]; p g960.reduce(RFix960.new(0), :^).to_s
g961 = [RFix960.new(1), RFix960.new(2)]; v961 = g961.reduce(:^).to_s; p v961

# is an array returned by partition
class RPar970
  attr_reader :units
  def initialize(u) = @units = u
  def +(other) = RPar970.new(units + other.units)
  def negative? = units.negative?
  def to_s = units.to_s
end
g970 = [RPar970.new(3), RPar970.new(-2), RPar970.new(5)]
c970, d970 = g970.partition { |x970| !x970.negative? }
p c970.reduce(RPar970.new(0), :+).to_s
v971 = c970.reduce(RPar970.new(0), :+).to_s; p v971

# A user-defined #join whose receiver is the reduce accumulator
class Box611
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def join(other) = Box611.new(@value + other.value)
end
p([Box611.new(2), Box611.new(3)].reduce(Box611.new(0)) { |a611, b611| a611.join(b611) }.value)
w611 = [Box611.new(2)].reduce(Box611.new(0)) { |c611, d611| c611.join(d611) }.value; p w611

# A user-defined #pack whose receiver is the reduce accumulator
class Crate614
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def pack(other) = Crate614.new(@value + other.value)
end
p([Crate614.new(2), Crate614.new(3)].reduce(Crate614.new(0)) { |a614, b614| a614.pack(b614) }.value)
w614 = [Crate614.new(2)].reduce(Crate614.new(0)) { |c614, d614| c614.pack(d614) }.value; p w614

# Folding an Array of a self-referencing class into a seed instance
class Node612
  attr_reader :value, :left, :right, :size

  def self.empty = new(nil, nil, nil, 0)

  def initialize(value, left, right, size)
    @value = value
    @left = left
    @right = right
    @size = size
  end

  def empty? = @size.zero?

  def meld(other)
    return other if empty?
    return self if other.empty?

    Node612.new(@value, (@right || Node612.empty).meld(other), @left, @size + other.size)
  end

  def push(item) = meld(Node612.new(item, nil, nil, 1))

  def pop
    rest = [@left, @right].compact.reduce(Node612.empty) { |acc612, kid612| acc612.meld(kid612) }
    [@value, rest]
  end

  def drain
    out = []
    node = self
    until node.empty?
      item, node = node.pop
      out << item
    end
    out
  end
end
p((n612 = [Node612.empty]; [3, 1, 2].each { |x612| n612 << n612.last.push(x612) }; n612.last.drain))
w612 = (m612 = [Node612.empty]; [3, 1, 2].each { |y612| m612 << m612.last.push(y612) }; m612.last.drain); p w612
