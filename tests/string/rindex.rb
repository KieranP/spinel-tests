# frozen_string_literal: true
# String#rindex
p("abcabc".rindex("b"))
a099 = "abcabc"; p(a099.rindex("b"))
a100 = "abcabc"; b100 = "b"; p(a100.rindex(b100))
a101 = "abcabc"; b101 = "b"; c101 = (a101.rindex(b101)); p c101
# rindex returns the character offset (not byte offset) on a multibyte receiver
p("héllo".rindex("l"))
a105 = "héllo"; c105 = (a105.rindex("l")); p c105
p("a☕b☕c".rindex("☕"))
# Regexp form (correct on multibyte, unlike #index)
p("héllo".rindex(/l/))
a106 = "héllo"; b106 = /l/; c106 = (a106.rindex(b106)); p c106
p("a☕b☕c".rindex(/☕/))

# A String returned from a method with a `raise` branch loses much of String's
# method table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_rdx(ordx)
  case ordx
  when Integer then "i"
  when String  then "sample text"
  else raise ArgumentError, "no"
  end
end
rb_rdx = (raisebr_rdx("ab").rindex("a") rescue $!.class); p rb_rdx

# The nil returned on a miss is dropped by compact and filter_map.
n700 = "a".rindex("/")
p([n700, 1].compact)
v700 = ["a", "b/c"].filter_map { |s700| s700.rindex("/") }; p v700

# ...but not once it has passed through a short-circuiting &&.
n707 = "a".rindex("/") && "a".upcase
p([n707, "z"].compact)
v707 = [n707, "z"].compact; p v707

# On a String returned by Fiber#resume.
f81rindex = Fiber.new { Fiber.yield('aabbcc'); nil }
w81rindex = f81rindex.resume
r81rindex = (w81rindex.rindex("b") rescue $!.class); p r81rindex
# an explicit end offset, including a negative one
p("abcabc".rindex("b", 3))
z001 = "abcabc"; v001 = z001.rindex("b", 3); p v001
p("abcabc".rindex(/b/, 3))
z002 = "abcabc"; b002 = /b/; v002 = z002.rindex(b002, 3); p v002
p("abcabc".rindex("b", -4))
p("abcabc".rindex("b", 0))
# an empty needle, and a needle that never occurs
p("abc".rindex(""))
p("abc".rindex("", 1))
p("abc".rindex("z"))
# a character offset on a multibyte receiver
p("héllo".rindex("l", 3))
z003 = "héllo"; v003 = z003.rindex("l", 3); p v003
