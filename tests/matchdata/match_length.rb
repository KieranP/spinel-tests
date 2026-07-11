# frozen_string_literal: true
# MatchData#match_length
p("abc".match(/(b)/).match_length(1))
m001 = "abc".match(/(b)/); v001 = m001.match_length(1); p v001

# match_length by name, and an unmatched optional group.
p("2024-01".match(/(?<y>\d+)-(?<mo>\d+)/).match_length(:y))
p("9".match(/(\d)(\d)?/).match_length(2))
p("hello".match(/l+/).match_length(0))
m002 = "2024-01".match(/(?<y>\d+)-(?<mo>\d+)/); v002 = m002.match_length(:mo); p v002
