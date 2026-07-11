# frozen_string_literal: true
# MatchData#to_s
p("hello".match(/l+/).to_s)
m001 = "hello".match(/l+/); v001 = m001.to_s; p v001

# to_s is the whole match, not the first group.
p("2024-01".match(/(\d+)-(\d+)/).to_s)
p("b".match(/(?<a>x)?(?<b>b)/).to_s)
m002 = "2024-01".match(/(\d+)-(\d+)/); v002 = m002.to_s; p v002
