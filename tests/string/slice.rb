# frozen_string_literal: true
# String#slice
p("hello".slice(1, 3))
a113 = "hello"; p(a113.slice(1, 3))
a114 = "hello"; b114 = 3; p(a114.slice(1, b114))
a115 = "hello"; b115 = 3; c115 = (a115.slice(1, b115)); p c115
# single index returns a one-character string
p("hello".slice(1))
p("hello".slice(-1))
a116 = "hello"; c116 = (a116.slice(0)); p c116
# negative start with length
p("hello".slice(-3, 2))
# length running past the end is clamped
p("hello".slice(1, 100))
# start exactly at length gives "", past length gives nil
p("hello".slice(5, 2))
p("hello".slice(6, 2))
# negative length gives nil
p("hello".slice(1, -1))
# out-of-range single index gives nil
p("hello".slice(10))
# Range forms
p("hello".slice(1..3))
p("hello".slice(1...3))
p("hello".slice(1..-1))
p("hello".slice(2..))
p("hello".slice(..2))
a117 = "hello"; c117 = (a117.slice(1..3)); p c117
# Regexp form, and Regexp + capture index
p("hello".slice(/l+/))
p("hello".slice(/(l)(l)/, 2))
# String argument returns the substring if present, else nil
p("hello".slice("ell"))
p("hello".slice("xyz"))
a118 = "hello"; b118 = "ell"; c118 = (a118.slice(b118)); p c118

# A String returned from a method with a `raise` branch loses much of String's
# method table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_sl(osl)
  case osl
  when Integer then "i"
  when String  then "sample text"
  else raise ArgumentError, "no"
  end
end
rb_sl = (raisebr_sl("ab").slice(0, 2) rescue $!.class); p rb_sl

# On a String returned by Fiber#resume.
f81slice = Fiber.new { Fiber.yield('aabbcc'); nil }
w81slice = f81slice.resume
r81slice = (w81slice.slice(1, 2) rescue $!.class); p r81slice

# A two-element splat keeps only the first argument: Ruby "el", Spinel "e".
k96slice = [1, 2]
p("hello".slice(*k96slice))
v96slice = "hello".slice(*k96slice); p v96slice
# control: the same arguments spread positionally
p("hello".slice(1, 2))
# a named capture group, and a capture index that does not exist
p("hello".slice(/(?<x>l)(?<y>o)/, "y"))
z001 = "hello"; v001 = z001.slice(/(?<x>l)(?<y>o)/, "y"); p v001
r002 = ("hello".slice(/(l)/, 5) rescue $!.class); p r002
# a Regexp that does not match, with and without a capture index
p("hello".slice(/z/))
p("hello".slice(/(z)/, 1))
# a Range whose start is past the end, and an exclusive endless Range
p("hello".slice(6..8))
p("hello".slice(5..8))
p("hello".slice(-3..))
p("hello".slice(...-1))
z003 = "hello"; v003 = z003.slice(...-1); p v003
# a zero length, and a start of exactly -length
p("hello".slice(2, 0))
p("hello".slice(-5, 2))
