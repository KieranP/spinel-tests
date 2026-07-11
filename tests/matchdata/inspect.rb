# frozen_string_literal: true
# MatchData#inspect
p("abc".match(/b/).inspect)
m001 = "abc".match(/b/); v001 = m001.inspect; p v001

# Numbered and named captures (incl. an unmatched optional group) in inspect.
p("2024-01".match(/(\d+)-(\d+)/).inspect)
m002 = "2024-01".match(/(\d+)-(\d+)/); v002 = m002.inspect; p v002
p("9".match(/(?<a>\d)(?<b>\d)?/).inspect)
m003 = "9".match(/(?<a>\d)(?<b>\d)?/); v003 = m003.inspect; p v003
