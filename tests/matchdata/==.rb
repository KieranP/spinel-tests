# frozen_string_literal: true
# MatchData#==
a001 = "abc".match(/b/); b001 = "abc".match(/b/); p(a001 == b001)
a002 = "abc".match(/b/); v002 = (a002 == a002); p v002

# Different matches of the same string are not equal.
a003 = "abc".match(/a/); b003 = "abc".match(/b/); p(a003 == b003)
a004 = "abc".match(/a/); b004 = "abc".match(/b/); v004 = (a004 == b004); p v004

# A MatchData is never == to a non-MatchData.
a005 = "abc".match(/b/); p(a005 == "b")
a006 = "abc".match(/b/); v006 = (a006 == nil); p v006
