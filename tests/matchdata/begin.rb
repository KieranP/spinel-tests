# frozen_string_literal: true
# MatchData#begin
p("hello".match(/l+/).begin(0))
p("hello".match(/(l)/).begin(1))
m001 = "hello".match(/l+/); p m001.begin(0)
m002 = "hello".match(/l+/); v002 = m002.begin(0); p v002

# Begin by capture name.
p("2024-01".match(/(?<y>\d+)-(?<mo>\d+)/).begin(:mo))
m003 = "2024-01".match(/(?<y>\d+)-(?<mo>\d+)/); v003 = m003.begin(:y); p v003

# An unmatched optional group begins at nil.
p("9".match(/(\d)(\d)?/).begin(2))
m004 = "b".match(/(?<a>x)?(?<b>b)/); v004 = m004.begin(:a); p v004

# An index past the last group raises IndexError; so does an unknown name.
m005 = "hello".match(/(l)/); r005 = (m005.begin(5) rescue $!.class); p r005
m006 = "hello".match(/(l)/); r006 = (m006.begin(:nope) rescue $!.class); p r006
