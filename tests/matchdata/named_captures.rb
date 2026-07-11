# frozen_string_literal: true
# MatchData#named_captures
p("2024-01".match(/(?<y>\d+)-(?<m>\d+)/).named_captures)
m001 = "2024-01".match(/(?<y>\d+)-(?<m>\d+)/); v001 = m001.named_captures; p v001

# symbolize_names: true (Symbol keys)
p("2024".match(/(?<y>\d+)/).named_captures(symbolize_names: true))
m002 = "2024".match(/(?<y>\d+)/); v002 = m002.named_captures(symbolize_names: true); p v002

# An unmatched optional named group appears as nil.
p("9".match(/(?<a>\d)(?<b>\d)?/).named_captures)
m003 = "9".match(/(?<a>\d)(?<b>\d)?/); v003 = m003.named_captures; p v003

# symbolize_names: false is the default — String keys.
p("2024-01".match(/(?<y>\d+)-(?<mo>\d+)/).named_captures(symbolize_names: false))
m004 = "2024-01".match(/(?<y>\d+)-(?<mo>\d+)/); v004 = m004.named_captures(symbolize_names: false); p v004

# No named groups yields an empty Hash.
p("hello".match(/l(l)o/).named_captures)
m005 = "hello".match(/l(l)o/); v005 = m005.named_captures; p v005

# An unmatched optional named group is nil under symbolize_names: true too.
p("9".match(/(?<a>\d)(?<b>\d)?/).named_captures(symbolize_names: true))
m006 = "9".match(/(?<a>\d)(?<b>\d)?/); v006 = m006.named_captures(symbolize_names: true); p v006
