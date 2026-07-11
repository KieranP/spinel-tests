# frozen_string_literal: true
# MatchData#offset
p("hello".match(/l+/).offset(0))
p("hello".match(/(l)/).offset(1))
m001 = "hello".match(/l+/); p m001.offset(0)
m002 = "hello".match(/l+/); v002 = m002.offset(0); p v002

# Offset by capture name.
p("2024-01".match(/(?<y>\d+)-(?<mo>\d+)/).offset(:mo))
m003 = "2024-01".match(/(?<y>\d+)-(?<mo>\d+)/); v003 = m003.offset(:y); p v003

# An unmatched optional group offsets to [nil, nil].
p("9".match(/(\d)(\d)?/).offset(2))
m004 = "9".match(/(\d)(\d)?/); v004 = m004.offset(2); p v004

# An unmatched optional named group offsets to [nil, nil].
p("b".match(/(?<a>x)?(?<b>b)/).offset(:a))
m005 = "b".match(/(?<a>x)?(?<b>b)/); v005 = m005.offset(:a); p v005

# An index past the last group raises IndexError; so does an unknown name.
m006 = "hello".match(/(l)/); r006 = (m006.offset(5) rescue $!.class); p r006
m007 = "hello".match(/(l)/); r007 = (m007.offset(:nope) rescue $!.class); p r007
