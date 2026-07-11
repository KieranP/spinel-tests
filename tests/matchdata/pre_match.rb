# frozen_string_literal: true
# MatchData#pre_match
p("hello".match(/l+/).pre_match)
m001 = "hello".match(/l+/); p m001.pre_match
m002 = "hello".match(/l+/); v002 = m002.pre_match; p v002

# A match at the start has an empty pre_match.
p("hello".match(/h/).pre_match)
m003 = "hello".match(/h/); v003 = m003.pre_match; p v003

# pre_match runs to the start of the whole match, not of the first group.
p("xxhello".match(/(?<g>ell)/).pre_match)
m004 = "xxhello"; v004 = m004.match(/(?<g>ell)/).pre_match; p v004

# pre_match off the $~ set by =~
"hello world" =~ /o w/; p $~.pre_match
