# frozen_string_literal: true
# MatchData#post_match
p("hello".match(/l+/).post_match)
m001 = "hello".match(/l+/); p m001.post_match
m002 = "hello".match(/l+/); v002 = m002.post_match; p v002

# A match at the end has an empty post_match.
p("hello".match(/o/).post_match)
m003 = "hello".match(/o/); v003 = m003.post_match; p v003

# post_match runs from the end of the whole match, not of the last group.
p("hellozz".match(/(?<g>ell)/).post_match)
m004 = "hellozz"; v004 = m004.match(/(?<g>ell)/).post_match; p v004

# post_match off the $~ set by =~
"hello world" =~ /o w/; p $~.post_match
