# frozen_string_literal: true
# MatchData#match
p("abc".match(/(b)/).match(1))
m001 = "abc".match(/(b)/); v001 = m001.match(1); p v001

# match by name, and an unmatched optional group.
p("2024-01".match(/(?<y>\d+)-(?<mo>\d+)/).match(:mo))
p("9".match(/(\d)(\d)?/).match(2))
p("hello".match(/l+/).match(0))
m002 = "2024-01".match(/(?<y>\d+)-(?<mo>\d+)/); v002 = m002.match(:y); p v002

# A String name aborts the C build. Kept commented: a compile abort takes down the file.
p("2024-01".match(/(?<y>\d+)-(?<mo>\d+)/).match("mo"))
m003 = "2024-01".match(/(?<y>\d+)-(?<mo>\d+)/); v003 = m003.match("y"); p v003
