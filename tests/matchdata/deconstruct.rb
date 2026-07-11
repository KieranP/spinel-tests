# frozen_string_literal: true
# MatchData#deconstruct
p("abc".match(/(a)(b)/).deconstruct)
m001 = "abc".match(/(a)(b)/); v001 = m001.deconstruct; p v001

# deconstruct omits the whole match, and holds nil for an unmatched optional group.
p("9".match(/(\d)(\d)?/).deconstruct)
m002 = "9".match(/(\d)(\d)?/); v002 = m002.deconstruct; p v002

# A MatchData drives an array pattern in `case/in`.
m003 = "ab".match(/(a)(b)/)
case m003
in [x003, y003] then p [x003, y003]
else p :none
end
