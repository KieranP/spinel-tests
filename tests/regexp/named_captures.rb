# frozen_string_literal: true
# Regexp — named captures
p("2024-01".match(/(?<y>\d+)-(?<m>\d+)/)[:y])
p("2024-01".match(/(?<y>\d+)-(?<m>\d+)/).named_captures)
# Regexp#named_captures (no arg)
p /(?<a>\d+)/.named_captures
a001 = /(?<a>\d+)/; b001 = (a001.named_captures); p b001

# MatchData#named_captures with symbolize_names
p "x1".match(/(?<a>\d)/).named_captures(symbolize_names: true)
a002 = "x1".match(/(?<a>\d)/); v002 = (a002.named_captures(symbolize_names: true)); p v002

# accessing a named capture by String and by Symbol
p "2024-01".match(/(?<y>\d+)-(?<mo>\d+)/)["mo"]
a003 = "2024-01".match(/(?<y>\d+)-(?<mo>\d+)/); v003 = (a003[:y]); p v003

# named backreference \k<name> in the pattern
p "abcabc".match(/(?<x>abc)\k<x>/)[0]
a004 = "abcabc"; v004 = (a004.match(/(?<x>abc)\k<x>/)[0]); p v004

# a named capture that did not participate is nil
p "b".match(/(?<a>x)?b/)[:a]
a005 = "b"; v005 = (a005.match(/(?<a>x)?b/)[:a]); p v005

# named_captures with an explicit symbolize_names: false
p("2024-01".match(/(?<y>\d+)-(?<mo>\d+)/).named_captures(symbolize_names: false))
a006 = "x1".match(/(?<a>\d)/); v006 = a006.named_captures(symbolize_names: false); p v006

# Regexp#named_captures maps each name to its group numbers
p(/(?<a>x)(?<b>y)/.named_captures)
p(/(?<a>x)|(?<a>y)/.named_captures)
p(/(x)/.named_captures)
a007 = Regexp.new("(?<z>\\d+)"); v007 = a007.named_captures; p v007
