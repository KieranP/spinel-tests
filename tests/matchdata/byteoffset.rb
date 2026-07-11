# frozen_string_literal: true
# MatchData#byteoffset
p("hello".match(/l+/).byteoffset(0))
p("hello".match(/(l)/).byteoffset(1))
m001 = "hello".match(/l+/); v001 = m001.byteoffset(0); p v001

# An unmatched optional group byte-offsets to [nil, nil].
p("9".match(/(\d)(\d)?/).byteoffset(2))
m002 = "b".match(/(?<a>x)?(?<b>b)/); v002 = m002.byteoffset(:a); p v002
