# frozen_string_literal: true
# MatchData#size
p("hello".match(/l(l)o/).size)
m001 = "hello".match(/l(l)o/); v001 = m001.size; p v001

# size counts the whole match plus every group, matched or not.
p("hello".match(/l+/).size)
p("9".match(/(?<a>\d)(?<b>\d)?/).size)
m002 = "9".match(/(?<a>\d)(?<b>\d)?/); v002 = m002.size; p v002

# A named group turns off numbered capturing, so the plain group is not counted.
p("a1".match(/(?<l>[a-z])(\d)/).size)
m003 = "a1".match(/(?<l>[a-z])(\d)/); v003 = m003.size; p v003
