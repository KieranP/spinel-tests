# frozen_string_literal: true
# MatchData#regexp
p("hello".match(/l/).regexp)
m001 = "hello".match(/l/); v001 = m001.regexp; p v001

# regexp answers the pattern that produced the match, flags and all.
p("HELLO".match(/l+/i).regexp)
p("2024-01".match(/(?<y>\d+)-(?<mo>\d+)/).regexp.names)
m002 = "HELLO".match(/l+/i); v002 = m002.regexp.source; p v002
