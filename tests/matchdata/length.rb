# frozen_string_literal: true
# MatchData#length
p("hello".match(/l(l)o/).length)
m001 = "hello".match(/l(l)o/); v001 = m001.length; p v001

# length counts the whole match plus every group, matched or not.
p("hello".match(/l+/).length)
p("9".match(/(?<a>\d)(?<b>\d)?/).length)
m002 = "9".match(/(?<a>\d)(?<b>\d)?/); v002 = m002.length; p v002

# A named group turns off numbered capturing, so the plain group is not counted.
p("a1".match(/(?<l>[a-z])(\d)/).length)
m003 = "a1".match(/(?<l>[a-z])(\d)/); v003 = m003.length; p v003
