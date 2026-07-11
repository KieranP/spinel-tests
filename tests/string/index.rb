# frozen_string_literal: true
# String#index
p("abcabc".index("b"))
a070 = "abcabc"; p(a070.index("b"))
a071 = "abcabc"; b071 = "b"; p(a071.index(b071))
a072 = "abcabc"; b072 = "b"; c072 = (a072.index(b072)); p c072
a153 = "abcabc"; b153 = /b/; p(a153.index(b153))
v158 = "abcabc"; v159 = /b/; v160 = (v158.index(v159)); p v160
# String-argument index counts characters on a multibyte receiver
p("héllo".index("l"))
a161 = "héllo"; c161 = (a161.index("l")); p c161
p("héllo".index("l", 3))
p("a☕b☕c".index("☕"))
# Regexp-argument index must return the character offset, not the byte offset
p("héllo".index(/l/))
a162 = "héllo"; b162 = /l/; c162 = (a162.index(b162)); p c162
p("☕abc".index(/b/))

# A String returned from a method with a `raise` branch loses much of String's
# method table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_idx(oidx)
  case oidx
  when Integer then "i"
  when String  then "sample text"
  else raise ArgumentError, "no"
  end
end
rb_idx = (raisebr_idx("ab").index("a") rescue $!.class); p rb_idx

# The nil returned on a miss is dropped by compact and filter_map.
n701 = "a".index("/")
p([n701, 1].compact)
v701 = ["a", "b/c"].filter_map { |s701| s701.index("/") }; p v701

# ...but not once it has passed through a short-circuiting &&.
n708 = "a".index("/") && "a".upcase
p([n708, "z"].compact)
v708 = [n708, "z"].compact; p v708

# On a String returned by Fiber#resume.
f81index = Fiber.new { Fiber.yield('aabbcc'); nil }
w81index = f81index.resume
r81index = (w81index.index("b") rescue $!.class); p r81index

# a splatted argument list held in a variable
si160 = ["l"]
p("hello".index(*si160))
vi160 = "hello".index(*si160); p vi160
# control: the same argument positionally, and a literal array splatted in place
p("hello".index("l"))
p("hello".index(*["l"]))
# an explicit start offset, including a negative one
p("abcabc".index("b", 2))
z001 = "abcabc"; v001 = z001.index("b", 2); p v001
p("abcabc".index(/b/, 2))
z002 = "abcabc"; b002 = /b/; v002 = z002.index(b002, 2); p v002
p("abcabc".index("b", -3))
p("abcabc".index("b", 5))
# an empty needle matches at the offset, and an offset past the end
p("abc".index(""))
p("abc".index("", 2))
p("abc".index("", 3))
p("abc".index("a", 10))
# a character offset on a multibyte receiver
p("héllo".index("l", 3))
z003 = "héllo"; v003 = z003.index("l", 3); p v003
