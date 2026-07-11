# frozen_string_literal: true
# String#downcase
p("HeLLo".downcase)
a049 = "HeLLo"; p(a049.downcase)
a050 = "HeLLo"; c050 = (a050.downcase); p c050
# already lower / empty / mixed with non-letters
p("abc".downcase)
p("".downcase)
p("MIXED CASE 123".downcase)
p("PUNCT!? ABC-DEF".downcase)
a051 = "MIXED CASE 123"; c051 = (a051.downcase); p c051
# downcase returns a new String; receiver unchanged
a052 = "HeLLo"; a052.downcase; p a052
# result class and equality
p("HELLO".downcase.class)
a053 = "HELLO"; v053 = (a053.downcase == "hello"); p v053
# non-ASCII case folding needs Unicode case tables Spinel does not carry (cf. limitations.md grapheme_clusters / "no encoding")
# non-ASCII (Latin-1) Unicode case folding
p("HÉLLO".downcase)
a054 = "HÉLLO"; c054 = (a054.downcase); p c054
