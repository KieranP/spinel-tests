# frozen_string_literal: true
# MatchData#eql?
a001 = "hi".match(/h/); b001 = "hi".match(/h/); p(a001.eql?(b001))
a002 = "hi".match(/h/); v002 = a002.eql?(a002); p v002
