# frozen_string_literal: true
# String#slice!
p((+"hello").slice!(0))
a116 = +"hello"; a116.slice!(0); p a116
a117 = +"hello"; b117 = 0; a117.slice!(b117); p a117
a118 = +"hello"; b118 = 0; c118 = (a118.slice!(b118)); p c118
a119 = +"hello"; a119.slice!(/l+/); p a119
a120 = +"hello"; c120 = (a120.slice!(/l+/)); p c120
p((+"hello").slice!(/l+/))
x122 = (+"hello").slice!("l"); p x122
# String and Regexp arguments index by character correctly on multibyte receivers
a123 = +"héllo"; a123.slice!("é"); p a123
a124 = +"héllo"; a124.slice!(/l+/); p a124.bytes
# Integer index / start+length / Range should count characters, not bytes
a125 = +"héllo"; a125.slice!(1); p a125.bytes
a126 = +"héllo"; b126 = 1; a126.slice!(b126); p a126.bytes
a127 = +"héllo"; a127.slice!(1, 2); p a127.bytes
a128 = +"héllo"; a128.slice!(1..2); p a128.bytes
# the remaining #slice! signatures: start+length, Range, negative and out-of-range index,
# and a String argument
z001 = +"hello"; c001 = z001.slice!(1, 3); p c001; p z001
z002 = +"hello"; c002 = z002.slice!(1..3); p c002; p z002
z003 = +"hello"; c003 = z003.slice!(-1); p c003; p z003
z004 = +"hello"; c004 = z004.slice!(10); p c004; p z004
z005 = +"hello"; c005 = z005.slice!("ell"); p c005; p z005
z006 = +"hello"; c006 = z006.slice!(1, 100); p c006; p z006
z007 = +"hello"; c007 = z007.slice!(/(l)(l)/, 2); p c007; p z007
