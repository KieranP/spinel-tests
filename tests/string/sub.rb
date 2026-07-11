# frozen_string_literal: true
# String#sub
p("hello".sub("l", "L"))
a129 = "hello"; p(a129.sub("l", "L"))
a130 = "hello"; b130 = "l"; p(a130.sub(b130, "L"))
a131 = "hello"; b131 = "l"; c131 = (a131.sub(b131, "L")); p c131
p("hello".sub(/l/) { |m| m.upcase })
v171 = ("hello".sub(/l/) { |m| m.upcase }); p v171
p("hello".sub("l") { |m| m.upcase })
v172 = ("hello".sub("l") { |m| m.upcase }); p v172
# only the first occurrence is replaced
p("aaa".sub("a", "b"))
# no match returns an unchanged copy
p("hello".sub("z", "Q"))
a132 = "hello"; c132 = (a132.sub("z", "Q")); p c132
# numeric backreference (single-quoted so \1 reaches sub)
p("hello".sub(/(l)/, '[\1]'))
a133 = "hello"; c133 = (a133.sub(/(l)/, '[\1]')); p c133
# whole-match backreference
p("hello".sub(/l+/, '<\0>'))
# Hash replacement
p("hello".sub(/l/, "l" => "L"))
# a literal doubled backslash "\\" in the replacement should collapse to one backslash
p("a".sub("a", "\\\\").bytes)
a134 = "a"; c134 = (a134.sub("a", "\\\\").bytes); p c134

# A String returned from a method with a `raise` branch loses much of String's
# method table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_sb(osb)
  case osb
  when Integer then "i"
  when String  then "sample text"
  else raise ArgumentError, "no"
  end
end
rb_sb = (raisebr_sb("ab").sub("s", "x") rescue $!.class); p rb_sb

# #sub on a String returned by Fiber#resume.
f80sub = Fiber.new { Fiber.yield("t=1.5"); nil }
w80sub = f80sub.resume
r80sub = (w80sub.sub("t=", "") rescue $!.class); p r80sub

# A splatted argument list reports NoMethodError for a method that resolves when
# the same arguments are spread positionally: Ruby "heLlo".
k96sub = ["l", "L"]
r96sub = ("hello".sub(*k96sub) rescue $!.class); p r96sub
v96sub = ("hello".sub(*k96sub) rescue $!.class); p v96sub
# control: the same arguments spread positionally
p("hello".sub("l", "L"))
p("hello".sub(/l/, '\`'))
v_pm = ("hello".sub(/l/, '\`')); p v_pm
p("hello".sub(/l/, "\\'"))
v_po = ("hello".sub(/l/, "\\'")); p v_po
h_hd = Hash.new("?"); h_hd["l"] = "L"; p("hello".sub(/[el]/, h_hd))
v_hd = ("hello".sub(/[el]/, h_hd)); p v_hd
# a Hash replacement with no default: a missing key substitutes ""
p("hello".sub(/[el]/, "l" => "L"))
# the block form sees $1 and $~
p("hello".sub(/(l)(o)/) { "#{$2}#{$1}" })
v_blk = ("hello".sub(/(l)(o)/) { "#{$2}#{$1}" }); p v_blk
# sub with a String pattern treats it literally, not as a Regexp
p("a.c".sub(".", "-"))
p("abc".sub(".", "-"))
p("a1b2".sub(/(?<l>[a-z])(?<n>\d)/) { "#{$~[:n]}#{$~[:l]}" })
v_sy = ("a1b2".sub(/(?<l>[a-z])(?<n>\d)/) { "#{$~[:n]}#{$~[:l]}" }); p v_sy
# numeric $~ indexing in the same block is correct
p("a1b2".sub(/([a-z])(\d)/) { $~[2] })
