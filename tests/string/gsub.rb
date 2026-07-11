# frozen_string_literal: true
# String#gsub
p("hello".gsub("l", "L"))
a062 = "hello"; p(a062.gsub("l", "L"))
a063 = "hello"; b063 = "l"; p(a063.gsub(b063, "L"))
a064 = "hello"; b064 = "l"; c064 = (a064.gsub(b064, "L")); p c064
p("hello".gsub(/l/) { |m| m.upcase })
v169 = ("hello".gsub(/l/) { |m| m.upcase }); p v169
p("hello".gsub("l") { |m| m.upcase })
v170 = ("hello".gsub("l") { |m| m.upcase }); p v170
# gsub(regexp) enumerator form (no block/replacement)
p("aaa".gsub(/a/).to_a)
v081 = ("aaa".gsub(/a/).to_a); p v081
# no match returns an unchanged copy
p("hello".gsub("z", "Q"))
# empty pattern inserts between every character
p("abc".gsub("", "-"))
p("abc".gsub(//, "-"))
# regexp replacement with numeric backreference (single-quoted so \1 reaches gsub)
p("John Smith".gsub(/(\w+)\s(\w+)/, '\2 \1'))
a065 = "John Smith"; c065 = (a065.gsub(/(\w+)\s(\w+)/, '\2 \1')); p c065
# whole-match \0 / \& backreference
p("abc".gsub(/b/, '[\0]'))
p("abc".gsub(/b/, '[\&]'))
# named backreference
p("abc".gsub(/(?<x>b)/, '[\k<x>]'))
# Hash replacement
p("hello".gsub(/[el]/, "e" => "3", "l" => "1"))
a066 = "hello"; c066 = (a066.gsub(/[el]/, "e" => "3", "l" => "1")); p c066
# block receives the match; $~ is set
p("a1b2".gsub(/([a-z])(\d)/) { "#{$2}#{$1}" })
# a literal doubled backslash "\\" in the replacement should collapse to one backslash
p("a".gsub("a", "\\\\").bytes)
a067 = "a"; c067 = (a067.gsub("a", "\\\\").bytes); p c067
p("ab cd".gsub(/\b\w/) { |c068| c068.upcase })
a068 = "ab cd"; c068b = (a068.gsub(/\b\w/) { |c| c.upcase }); p c068b

# A String returned from a method with a `raise` branch loses much of String's
# method table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_gs(ogs)
  case ogs
  when Integer then "i"
  when String  then "sample text"
  else raise ArgumentError, "no"
  end
end
rb_gs = (raisebr_gs("ab").gsub("s", "x") rescue $!.class); p rb_gs

# #gsub on a String returned by Fiber#resume.
f80gsub = Fiber.new { Fiber.yield("t=1.5"); nil }
w80gsub = f80gsub.resume
r80gsub = (w80gsub.gsub("t=", "") rescue $!.class); p r80gsub
p("hello".gsub(/l/, '\`'))
v_pm = ("hello".gsub(/l/, '\`')); p v_pm

h_hd = Hash.new("?"); h_hd["e"] = "3"; p("hello".gsub(/[el]/, h_hd))
v_hd = ("hello".gsub(/[el]/, h_hd)); p v_hd
# a String pattern is literal, not a Regexp
p("a.c.e".gsub(".", "-"))
p("a1b2".gsub(/(?<l>[a-z])(?<n>\d)/) { "#{$~[:n]}#{$~[:l]}" })
v_nc = ("a1b2".gsub(/(?<l>[a-z])(?<n>\d)/) { "#{$~[:n]}#{$~[:l]}" }); p v_nc
# numeric $~ indexing, $1/$2 and #captures in the same block are correct
p("a1b2".gsub(/([a-z])(\d)/) { $~[2] })
p("a1b2".gsub(/(?<l>[a-z])(?<n>\d)/) { $~.captures.join("-") })
v_nx = ("a1b2".gsub(/([a-z])(\d)/) { $~[2] }); p v_nx

T972 = "the quick brown fox jumps over the lazy dog"
E972 = T972.gsub(/[aeiou]/, "-")
g972 = 4.times.map { Thread.new { b972 = 0; 500.times { b972 += 1 if T972.gsub(/[aeiou]/, "-") != E972 }; b972 } }
p g972.map(&:value).sum == 0
v973 = g972.map(&:value).sum == 0; p v973
