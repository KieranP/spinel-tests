# frozen_string_literal: true
# MatchData#deconstruct_keys
p("aXbXc".match(/(?<a>b)/).deconstruct_keys([:a]))
m001 = "aXbXc".match(/(?<a>b)/); v001 = m001.deconstruct_keys([:a]); p v001

# nil requests all named captures
p("2024-01".match(/(?<y>\d+)-(?<mo>\d+)/).deconstruct_keys(nil))
m002 = "2024-01".match(/(?<y>\d+)-(?<mo>\d+)/); v002 = m002.deconstruct_keys(nil); p v002

# A proper subset returns only the requested keys.
p("2024-01".match(/(?<y>\d+)-(?<mo>\d+)/).deconstruct_keys([:y]))
m003 = "2024-01".match(/(?<y>\d+)-(?<mo>\d+)/); v003 = m003.deconstruct_keys([:y]); p v003

# An empty array requests nothing.
p("2024-01".match(/(?<y>\d+)-(?<mo>\d+)/).deconstruct_keys([]))
m004 = "2024-01".match(/(?<y>\d+)-(?<mo>\d+)/); v004 = m004.deconstruct_keys([]); p v004

# A key not present yields {}.
p("ab".match(/(?<p>a)/).deconstruct_keys([:p, :q]))
m005 = "ab".match(/(?<p>a)/); v005 = m005.deconstruct_keys([:p, :q]); p v005

# An Array of Strings, or a non-Array argument, raises TypeError.
m006 = "ab".match(/(?<a>a)/); r006 = (m006.deconstruct_keys(["a"]) rescue $!.class); p r006
m007 = "ab".match(/(?<a>a)/); r007 = (m007.deconstruct_keys(1) rescue $!.class); p r007

# An unmatched optional named group is present with a nil value.
p("9".match(/(?<a>\d)(?<b>\d)?/).deconstruct_keys(nil))
m008 = "9".match(/(?<a>\d)(?<b>\d)?/); v008 = m008.deconstruct_keys([:b]); p v008

# A MatchData drives a hash pattern in `case/in`.
m009 = "2024-01".match(/(?<y>\d+)-(?<mo>\d+)/)
case m009
in { y: String => y009, mo: String => mo009 } then p [y009, mo009]
end
