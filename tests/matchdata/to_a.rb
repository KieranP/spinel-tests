# frozen_string_literal: true
# MatchData#to_a
p("hello".match(/l(l)o/).to_a)
m001 = "hello".match(/l(l)o/); v001 = m001.to_a; p v001

# to_a includes the whole match first, and nil for an unmatched optional group.
p("9".match(/(?<a>\d)(?<b>\d)?/).to_a)
m002 = "9".match(/(?<a>\d)(?<b>\d)?/); v002 = m002.to_a; p v002

# to_a on a group-less pattern is just the whole match.
p("hello".match(/l+/).to_a)
m003 = "hello".match(/l+/); v003 = m003.to_a; p v003

# The Array is a fresh copy — mutating it leaves the MatchData alone.
m004 = "hello".match(/l(l)o/); a004 = m004.to_a; a004 << "x"; p a004; p m004.to_a

# A named group turns off numbered capturing, so the plain group is absent.
p("a1".match(/(?<l>[a-z])(\d)/).to_a)
m005 = "a1".match(/(?<l>[a-z])(\d)/); v005 = m005.to_a; p v005
