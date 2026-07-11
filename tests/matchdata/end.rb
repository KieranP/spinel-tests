# frozen_string_literal: true
# MatchData#end
p("hello".match(/l+/).end(0))
p("hello".match(/(l)/).end(1))
m001 = "hello".match(/l+/); p m001.end(0)
m002 = "hello".match(/l+/); v002 = m002.end(0); p v002

# End by capture name.
p("2024-01".match(/(?<y>\d+)-(?<mo>\d+)/).end(:mo))
m003 = "2024-01".match(/(?<y>\d+)-(?<mo>\d+)/); v003 = m003.end(:y); p v003

# An unmatched optional group ends at nil.
p("9".match(/(\d)(\d)?/).end(2))
m004 = "b".match(/(?<a>x)?(?<b>b)/); v004 = m004.end(:a); p v004

# An index past the last group raises IndexError; so does an unknown name.
m005 = "hello".match(/(l)/); r005 = (m005.end(5) rescue $!.class); p r005
m006 = "hello".match(/(l)/); r006 = (m006.end(:nope) rescue $!.class); p r006
