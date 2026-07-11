# frozen_string_literal: true
# Array#inject

p [].inject { |a, b| a + b }
v090 = [].inject { |a, b| a + b }; p v090

p([1, 2, 3, 4].inject(10, :+))

a001 = [1, 2, 3, 4]
p a001.class
p a001.inject(10, :+)

a002 = [1, 2, 3, 4]
b002 = 10
p b002.class
p a002.inject(b002, :+)

a003 = [1, 2, 3, 4]
b003 = 10
c003 = a003.inject(b003, :+)
p c003.class
p c003

p([1.1, 2.2, 3.3].inject(1.0, :+))

a004 = [1.1, 2.2, 3.3]
p a004.class
p a004.inject(1.0, :+)

a005 = [1.1, 2.2, 3.3]
b005 = 1.0
p b005.class
p a005.inject(b005, :+)

a006 = [1.1, 2.2, 3.3]
b006 = 1.0
c006 = a006.inject(b006, :+)
p c006.class
p c006

p([1, 2, 3, 4].inject(1, :*))

a007 = [1, 2, 3, 4]
p a007.class
p a007.inject(1, :*)

a008 = [1, 2, 3, 4]
b008 = 1
p b008.class
p a008.inject(b008, :*)

a009 = [1, 2, 3, 4]
b009 = 1
c009 = a009.inject(b009, :*)
p c009.class
p c009

p(["a", "b", "c"].inject("", :+))

a010 = ["a", "b", "c"]
p a010.class
p a010.inject("", :+)

a011 = ["a", "b", "c"]
b011 = ""
p b011.class
p a011.inject(b011, :+)

a012 = ["a", "b", "c"]
b012 = ""
c012 = a012.inject(b012, :+)
p c012.class
p c012

aij = [3.0, 4.0]; p aij.zip(aij).map { |x, y| x * y }.inject(0, :+)

def horner899(c899, x899); c899.inject(0) { |a899, e899| a899 * x899 + e899 }; end
p(horner899([2, -3, 4, -5], 2))
p(horner899([2, -3, 4, -5], Rational(1, 2)))
v899 = horner899([2, -3, 4, -5], Rational(1, 2)); p v899

# An explicit nil seed types the accumulator as C `void`.
# Kept commented: the compile abort takes down the whole file.
p [1, 2, 3].inject(nil) { |acc587, t587| acc587.nil? ? t587 : t587 + acc587 }
v587 = [1, 2, 3].inject(nil) { |b587, u587| b587.nil? ? u587 : b587 + u587 }; p v587
p ["a", "b"].inject(nil) { |c587, w587| c587.nil? ? w587 : c587 + w587 }

# An operator on the value returned by `inject` misses the user class's own method
# once that class also defines `coerce` and a built-in appears on the left somewhere
# (`1 / bx97`). Rescue-wrapped so the NoMethodError can't abort the rest of the file.
class Box97
  attr_reader :v
  def initialize(v); @v = v; end
  def self.scalar(x); new(x); end
  def coerce(other); [Box97.scalar(other), self]; end
  def +(o); Box97.new(@v + (o.is_a?(Box97) ? o.v : o)); end
  def /(other)
    o = other.is_a?(Box97) ? other : Box97.scalar(other)
    Box97.new(Rational(@v) / o.v)
  end
  def to_s; "Box97(#{@v})"; end
end
bx97 = Box97.new(2)
p((1 / bx97).to_s)
items97 = [Box97.new(3), Box97.new(4)]
total97 = items97.inject(Box97.new(0)) { |a97, e97| a97 + e97 }
r97 = (total97 / items97.length).to_s rescue $!.class
p r97

# symbol, init+symbol, block and init+block forms
g901 = [1, 2, 3, 4]
p g901.inject(:*)
v901 = g901.inject(:*); p v901
p g901.inject(10, :+)
v902 = g901.inject(10, :+); p v902
p g901.inject { |s903, x903| s903 + x903 }
v903 = g901.inject { |s904, x904| s904 + x904 }; p v903
p g901.inject(2) { |s905, x905| s905 * x905 }
v905 = g901.inject(2) { |s906, x906| s906 * x906 }; p v905
s907 = :+
p g901.inject(s907)
v907 = g901.inject(s907); p v907
g908 = [7]
p g908.inject(:+)
v908 = g908.inject { |s909, x909| s909 + x909 }; p v908

# an Array accumulator over an Array of Arrays
g910 = [[1, 2], [3, 4]]
p g910.inject { |a911, r911| a911 + r911 }
v911 = g910.inject(:+); p v911
g912 = [[1, 2], [3, 4]]; p g912.inject([]) { |a912, r912| a912 + r912 }

# an unknown Symbol operator raises NoMethodError in CRuby
g913 = ([1, 2].inject(:nope) rescue $!.class); p g913

# Array#& as the fold operator, over an Array of Arrays
g900 = [[1, 2], [2, 3]]; p g900.inject { |a900, r900| a900 & r900 }
g914 = [[1, 2], [2, 3]]; v901 = g914.inject { |a901, r901| a901 & r901 }; p v901

# user-defined type whose operator has no other call site in the program
class IFix960
  attr_reader :units
  def initialize(u) = @units = u
  def ^(other) = IFix960.new(units + other.units)
  def to_s = units.to_s
end
g962 = [IFix960.new(1), IFix960.new(2)]; p g962.inject(IFix960.new(0), :^).to_s
g963 = [IFix960.new(1), IFix960.new(2)]; v963 = g963.inject(:^).to_s; p v963

# is an array returned by partition
class IPar970
  attr_reader :units
  def initialize(u) = @units = u
  def +(other) = IPar970.new(units + other.units)
  def negative? = units.negative?
  def to_s = units.to_s
end
g972 = [IPar970.new(3), IPar970.new(-2), IPar970.new(5)]
c972, d972 = g972.partition { |x972| !x972.negative? }
p c972.inject(IPar970.new(0), :+).to_s
v973 = c972.inject(IPar970.new(0), :+).to_s; p v973
