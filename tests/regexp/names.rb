# frozen_string_literal: true
# Regexp#names
p(/(?<a>\w+)/.names)
a001 = /(?<a>\w+)/; b001 = (a001.names); p b001

# names lists every name once, in pattern order
p(/(?<a>x)(?<b>y)/.names)
p(/(?<a>x)|(?<a>y)/.names)
p(/(x)/.names)
a002 = Regexp.new("(?<z>\\d+)"); v002 = a002.names; p v002
a003 = /(?<a>x)|(?<a>y)/; v003 = a003.names; p v003
