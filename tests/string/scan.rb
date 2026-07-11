# frozen_string_literal: true
# String#scan
p("a1b2".scan(/\d/))
a110 = "a1b2"; p(a110.scan(/\d/))
a111 = "a1b2"; b111 = /\d/; p(a111.scan(b111))
a112 = "a1b2"; b112 = /\d/; c112 = (a112.scan(b112)); p c112
p("a1b2".scan(/(\d)/))
p("a1b2".scan(/(?<d>\d)/))
a113 = "aXbY"; c113 = (a113.scan(/(?<a>[a-z])(?<b>[A-Z])/)); p c113
r268 = []; "a(b)".scan(/[()]/) { |t268| r268 << t268 }; p r268
a268 = "a(b)"; s268 = []; a268.scan(/[()]/) { |t| s268 << t }; p s268
# scanning a multibyte literal and matching any character on a multibyte receiver
p("a☕b☕c".scan("☕"))
p("héllo".scan(/./))
a114 = "a☕b☕c"; c114 = (a114.scan("☕")); p c114
p("café".scan(/./).length)

def tok097(expr); ts = []; expr.scan(/\s*(\d+\.\d+|\d+|[+\-*\/()]|[a-z]+)/) { |m| ts << m[0] }; ts; end
# ["3 + 4 * 2", "(x + 12) / y", "3.14 * r", "1+2"].each { |e| p tok097(e).map { |t| t =~ /\A\d/ ? "N" : (t =~ /\A[a-z]/ ? "I" : "O") }.join }

# A String returned from a method with a `raise` branch loses much of String's
# method table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_sc(osc)
  case osc
  when Integer then "i"
  when String  then "sample text"
  else raise ArgumentError, "no"
  end
end
rb_sc = (raisebr_sc("ab").scan(/\w+/) rescue $!.class); p rb_sc
# scan on a String read out of a `{}`-then-filled Hash raises NoMethodError.
# Runtime error, so it stays live.
h500 = {}
h500["A1"] = "a1b2"
r500 = (h500["A1"].scan(/\d+/) rescue $!.class); p r500
r501 = (h500["A1"].scan(/\d+/).length rescue $!.class); p r501
s502 = h500["A1"]; r502 = (s502.scan(/\d+/) rescue $!.class); p r502
# populating the Hash from a literal instead works
h503 = { "A1" => "a1b2" }
p h503["A1"].scan(/\d+/)
v503 = h503["A1"].scan(/\d+/); p v503
# split and length on the identical receiver are unaffected
h504 = {}
h504["A1"] = "a1 b2"
p h504["A1"].split(" ")
p h504["A1"].length
# a block taking the capture groups as separate parameters
z001 = []; "a1b2".scan(/([a-z])(\d)/) { |x001, y001| z001 << [x001, y001] }; p z001
v001 = []; "a1b2".scan(/([a-z])(\d)/) { |x, y| v001 << x + y }; p v001
# a group that can fail to participate yields nil for it
p("abc".scan(/(a)(b)?/))
z002 = "abc"; v002 = z002.scan(/(a)(b)?/); p v002
# a pattern that can match the empty string
p("aaa".scan(/a*/))
# a single group is still wrapped in a one-element Array
p("a1".scan(/(\d)/))
# no match yields an empty Array, and the block form returns the receiver
p("abc".scan(/\d/))
z003 = []; r003 = "abc".scan(/\d/) { |m003| z003 << m003 }; p z003; p r003
z004 = []; "a1b2".scan(/(?<l>[a-z])(?<n>\d)/) { z004 << $~[:n] }; p z004
v004 = []; "a1b2".scan(/(?<l>[a-z])(?<n>\d)/) { v004 << $~[:n] }; p v004
# numeric $~ indexing in the same block is correct
z005 = []; "a1b2".scan(/([a-z])(\d)/) { z005 << $~[2] }; p z005

T970 = "the quick brown fox jumps over the lazy dog"
E970 = T970.scan(/[a-z]+/)
g970 = 4.times.map { Thread.new { b970 = 0; 500.times { b970 += 1 if T970.scan(/[a-z]+/) != E970 }; b970 } }
p g970.map(&:value).sum == 0
v971 = g970.map(&:value).sum == 0; p v971
