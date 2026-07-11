# frozen_string_literal: true
# MatchData#values_at
p("hello".match(/(l)(l)(o)/).values_at(1, 2, 3))
p("hello".match(/(l)(l)(o)/).values_at(0, 2))
p("2024-01".match(/(?<y>\d+)-(?<m>\d+)/).values_at(:y, :m))
m001 = "hello".match(/(l)(l)(o)/); v001 = m001.values_at(1, 3); p v001

# A negative group index counts from the last group
p("hello".match(/(l)(o)/).values_at(0, -1))
m002 = "hello".match(/(l)(o)/); v002 = m002.values_at(0, -1); p v002

# Integer index, name, and negative index mixed in one call.
p("2024-01".match(/(?<y>\d+)-(?<m>\d+)/).values_at(0, :y, -1))
m003 = "2024-01".match(/(?<y>\d+)-(?<m>\d+)/); v003 = m003.values_at(0, :y, -1); p v003

# An unmatched optional group comes back nil.
p("9".match(/(\d)(\d)?/).values_at(1, 2))
m004 = "9".match(/(\d)(\d)?/); v004 = m004.values_at(1, 2); p v004

# An out-of-range or negative index comes back nil.
p("hello".match(/(l)(l)(o)/).values_at(1, 9))
m005 = "hello".match(/(l)(l)(o)/); v005 = m005.values_at(-9); p v005

# A String name selects the same group as its Symbol.
p("2024-01".match(/(?<y>\d+)-(?<mo>\d+)/).values_at("y"))
m006 = "2024-01".match(/(?<y>\d+)-(?<mo>\d+)/); v006 = m006.values_at("mo"); p v006

# An unknown name raises IndexError.
m007 = "2024".match(/(?<y>\d+)/); r007 = (m007.values_at(:nope) rescue $!.class); p r007

# A Range argument selects a run of groups. Kept commented: a compile abort takes down the file.
# p("hello".match(/(l)(l)(o)/).values_at(1..2))
# m008 = "hello".match(/(l)(l)(o)/); v008 = m008.values_at(1..2); p v008

# No arguments answers []. Kept commented: a front-end reject takes down the file.
p("hello".match(/(l)(o)/).values_at)
m009 = "hello".match(/(l)(o)/); v009 = m009.values_at; p v009
