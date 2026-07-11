# frozen_string_literal: true
# MatchData#bytebegin
p("hello".match(/l+/).bytebegin(0))
p("hello".match(/(l)/).bytebegin(1))
m001 = "hello".match(/l+/); v001 = m001.bytebegin(0); p v001

# An unmatched optional group byte-begins at nil.
p("9".match(/(\d)(\d)?/).bytebegin(2))
m002 = "b".match(/(?<a>x)?(?<b>b)/); v002 = m002.bytebegin(:a); p v002
