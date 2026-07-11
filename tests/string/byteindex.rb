# frozen_string_literal: true
# String#byteindex
p("hello".byteindex("l"))
a01 = "hello"; p(a01.byteindex("l"))
a02 = "hello"; b02 = "l"; p(a02.byteindex(b02))
a03 = "hello"; b03 = "l"; c03 = (a03.byteindex(b03)); p c03
# start offset
p("hello".byteindex("l", 3))
# Regexp argument
p("hello".byteindex(/l+/))
# not found returns nil
p("hello".byteindex("z"))
a04 = "hello"; c04 = (a04.byteindex("z")); p c04

# On a String returned by Fiber#resume.
f81byteindex = Fiber.new { Fiber.yield('aabbcc'); nil }
w81byteindex = f81byteindex.resume
r81byteindex = (w81byteindex.byteindex("b") rescue $!.class); p r81byteindex
# an explicit start offset, and a Regexp needle with an offset
p("héllo".byteindex("l", 4))
z001 = "héllo"; v001 = z001.byteindex("l", 4); p v001
p("abcabc".byteindex(/b/, 2))
z002 = "abcabc"; v002 = z002.byteindex(/b/, 2); p v002
# an empty needle and a needle that never occurs
p("abc".byteindex(""))
p("abc".byteindex("z"))
