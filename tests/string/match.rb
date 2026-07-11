# frozen_string_literal: true
# String#match
a151 = "hello"; p(a151.match(/xyz/))
v163 = "hello"; v164 = (v163.match(/xyz/)); p v164
a152 = "hello"; p(a152.match(/l/).class)
v165 = "hello"; v166 = (v165.match(/l/).class); p v166
# String#match with a block returns the block's value
a153 = "foobar"; p(a153.match(/(o+)/) { |m| m[1].upcase })
v167 = "foobar"; v168 = (v167.match(/(o+)/) { |m| m[1].upcase }); p v168
# match returns a MatchData; captures are indexable
p("foobar".match(/(o+)(b)/))
a154 = "foobar"; m154 = a154.match(/(o+)(b)/); p m154[1]; p m154[2]
# named captures
a155 = "John"; m155 = a155.match(/(?<first>\w+)/); p m155[:first]
# pre_match / post_match
a156 = "foobar"; m156 = a156.match(/b/); p m156.pre_match; p m156.post_match
# match with a start position
p("hello".match(/l/, 3))
# a no-match returns nil, so .class is NilClass
p("hi".match(/z/).class)
a157 = "hi"; m157 = a157.match(/z/); p m157.class
# a String argument is converted to a Regexp in Ruby
p("hello".match("l").class)
a158 = "hello"; m158 = a158.match("l"); p m158.class
# an explicit start position
p("hello".match(/l/, 3)[0])
z001 = "hello"; v001 = z001.match(/l/, 3); p v001.begin(0)
p("hello".match(/l/, 4))
# a String pattern is compiled to a Regexp
p("hello".match("l+")[0])
z002 = "hello"; b002 = "l+"; v002 = z002.match(b002); p v002[0]
# the block form yields the MatchData and returns the block's value
p("hello".match(/(l)(o)/) { |m003| m003[2] })
v003 = ("hello".match(/(l)(o)/) { |m| m.captures }); p v003
# a miss with a block returns nil without calling it
p("hello".match(/z/) { |m004| :called })
# named captures and pre/post match
z005 = "hello".match(/(?<x>l+)/); p z005[:x]; p z005.pre_match; p z005.post_match

T974 = "the quick brown fox jumps over the lazy dog"
E974 = T974.match(/(\w+)\s+(\w+)/)[2]
g974 = 8.times.map { Thread.new { b974 = 0; 2000.times { b974 += 1 if T974.match(/(\w+)\s+(\w+)/)[2] != E974 }; b974 } }
p g974.map(&:value).sum == 0
v975 = g974.map(&:value).sum == 0; p v975
