# frozen_string_literal: true
# String#casecmp
p("ABC".casecmp("abc"))
a001 = "ABC"; b001 = "abc"; p(a001.casecmp(b001))
a002 = "ABC"; b002 = "abc"; v002 = (a002.casecmp(b002)); p v002
# ordering, case-insensitively
p("abc".casecmp("abd"))
p("abd".casecmp("abc"))
p("ABC".casecmp("abcd"))
# a non-String argument yields nil (not an error)
p("abc".casecmp(1))
a003 = "abc"; b003 = 1; v003 = (a003.casecmp(b003)); p v003
# ASCII case-folding only compares ASCII case
p("Hello".casecmp("HELLO"))

# A String returned from a method with a `raise` branch loses much of String's
# method table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_cc(occ)
  case occ
  when Integer then "i"
  when String  then "sample text"
  else raise ArgumentError, "no"
  end
end
rb_cc = (raisebr_cc("ab").casecmp("X") rescue $!.class); p rb_cc

# On a String returned by Fiber#resume.
f81casecmp = Fiber.new { Fiber.yield('aabbcc'); nil }
w81casecmp = f81casecmp.resume
r81casecmp = (w81casecmp.casecmp("AABBCC") rescue $!.class); p r81casecmp

# embedded NUL: the bytes after the NUL still take part in the comparison
p("a\0b".casecmp("a\0c"))
a004cc = "a\0b"; b004cc = "a\0c"; v004cc = a004cc.casecmp(b004cc); p v004cc
