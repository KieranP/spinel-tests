# frozen_string_literal: true
# MatchData#names
p("2024-01".match(/(?<y>\d+)-(?<m>\d+)/).names)
m001 = "2024-01".match(/(?<y>\d+)-(?<m>\d+)/); v001 = m001.names; p v001

# No named groups yields an empty array.
p("hello".match(/l(l)o/).names)
m002 = "hello".match(/l(l)o/); v002 = m002.names; p v002

# names lists every named group, in pattern order, matched or not.
p("b".match(/(?<a>x)?(?<b>b)/).names)
m003 = "b".match(/(?<a>x)?(?<b>b)/); v003 = m003.names; p v003

# A name reused across alternatives is listed once.
p("y".match(/(?<a>x)|(?<a>y)/).names)
m004 = "y".match(/(?<a>x)|(?<a>y)/); v004 = m004.names; p v004
