# frozen_string_literal: true
# MatchData#byteend
p("hello".match(/l+/).byteend(0))
p("hello".match(/(l)/).byteend(1))
m001 = "hello".match(/l+/); v001 = m001.byteend(0); p v001

# An unmatched optional group byte-ends at nil.
p("9".match(/(\d)(\d)?/).byteend(2))
m002 = "b".match(/(?<a>x)?(?<b>b)/); v002 = m002.byteend(:a); p v002
