# frozen_string_literal: true
# MatchData#captures
p("2024-01".match(/(\d+)-(\d+)/).captures)
m001 = "2024-01".match(/(\d+)-(\d+)/); v001 = m001.captures; p v001

# An unmatched optional group appears as nil.
p("2024".match(/(\d+)(-\d+)?/).captures)
m002 = "2024".match(/(\d+)(-\d+)?/); v002 = m002.captures; p v002

# No groups yields an empty array.
p("hello".match(/l+/).captures)
m003 = "hello".match(/l+/); v003 = m003.captures; p v003

# captures with named groups only, and with a mix of named and numbered.
p("2024-01".match(/(?<y>\d+)-(?<mo>\d+)/).captures)
p("a1".match(/(?<l>[a-z])(\d)/).captures)
m004 = "a1".match(/(?<l>[a-z])(\d)/); v004 = m004.captures; p v004
