# frozen_string_literal: true
# MatchData#[]
p("hello".match(/l(l)o/)[0])
p("hello".match(/l(l)o/)[1])
p("hello".match(/(?<x>l)/)[:x])
p("hello".match(/(?<x>l)/)["x"])
m001 = "hello".match(/l(l)o/); p m001[0]
m002 = "hello".match(/l(l)o/); v002 = m002[1]; p v002
m003 = "hello".match(/(?<x>l)/); p m003[:x]

# Two-argument (start, length) slice
p("hello".match(/(l)(o)/)[1, 2])
m004 = "hello".match(/(l)(o)/); v004 = m004[1, 2]; p v004

# Range index (bounded, one-sided, and full via -1)
p("hello".match(/(l)(o)/)[1..2])
p("hello".match(/(l)(o)/)[1..])
p("hello".match(/(l)(o)/)[0..-1])
m005 = "hello".match(/(l)(o)/); v005 = m005[1..2]; p v005

# Negative group index counts from the last group
p("hello".match(/(l)(o)/)[-1])
m006 = "hello".match(/(l)(o)/); v006 = m006[-1]; p v006

# Out-of-range integer index returns nil
p("hello".match(/(l)(o)/)[9])
m007 = "hello".match(/(l)(o)/); v007 = m007[9]; p v007

# Unmatched optional group returns nil (by index and by name)
p("2024".match(/(?<y>\d+)(?<m>\d+)?/)[2])
p("2024".match(/(?<y>\d+)(?<m>\d+)?/)[:m])
m008 = "2024".match(/(?<y>\d+)(?<m>\d+)?/); v008 = m008[2]; p v008

# A name that does not exist raises IndexError
r009 = ("hello".match(/(?<x>l)/)[:nope] rescue $!.class); p r009
m010 = "hello".match(/(?<x>l)/); r010 = (m010[:nope] rescue $!.class); p r010

# $~ after =~ indexes like any MatchData
"foobar" =~ /(o+)(b)/
p $~[0]
p $~[1]
g011 = $~; v011 = g011[2]; p v011

# A two-argument slice with a negative start, and one that runs past the last group
p("hello".match(/(l)(o)/)[-1, 1])
p("hello".match(/(l)(o)/)[1, 9])
p("hello".match(/(l)(o)/)[3, 1])
m012 = "hello".match(/(l)(o)/); v012 = m012[-2, 2]; p v012
m013 = "hello".match(/(l)(o)/); r013 = (m013[1, -1] rescue $!.class); p r013

# A negative index past the first group answers nil
p("hello".match(/(l)(o)/)[-3])
m014 = "hello".match(/(l)(o)/); v014 = m014[-3]; p v014

# A beginless Range slices from group 0
p("hello".match(/(l)(o)/)[..1])
m015 = "hello".match(/(l)(o)/); v015 = m015[..-1]; p v015

# A Range that runs past the last group, and an inverted one
p("hello".match(/(l)(o)/)[1..9])
p("hello".match(/(l)(o)/)[2..1])
m016 = "hello".match(/(l)(o)/); v016 = m016[1..9]; p v016

# A MatchData indexed after a round trip through an Array or a Hash
a017 = ["aa".match(/a/), "bb".match(/b/)]; p a017[0][0]
a018 = ["aa".match(/a/), "bb".match(/b/)]; v018 = a018.map { |m018| m018[0] }; p v018
h019 = { x: "zz".match(/z/) }; p h019[:x][0]
h020 = { x: "zz".match(/z/) }; v020 = h020[:x][0]; p v020
