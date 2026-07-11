# frozen_string_literal: true
# MatchData#hash
# Equal matches hash equal.
a001 = "hi".match(/h/); b001 = "hi".match(/h/); p(a001.hash == b001.hash)
a002 = "hi".match(/h/); b002 = "hi".match(/h/); v002 = (a002.hash == b002.hash); p v002

# A MatchData hashes equal to itself, and the hash is an Integer.
a003 = "hi".match(/h/); p(a003.hash == a003.hash)
a004 = "hi".match(/h/); v004 = a004.hash.is_a?(Integer); p v004

# Different matches should hash differently.
a005 = "hi".match(/h/); c005 = "hi".match(/i/); p(a005.hash == c005.hash)
a006 = "hi".match(/h/); c006 = "hi".match(/i/); v006 = (a006.hash == c006.hash); p v006
