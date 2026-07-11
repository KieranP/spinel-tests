# frozen_string_literal: true
# Regexp.try_convert
p(Regexp.try_convert(/a/))
p(Regexp.try_convert("a"))
a001 = /a/; p(Regexp.try_convert(a001))

# try_convert answers nil for anything that is not a Regexp
p(Regexp.try_convert(nil))
p(Regexp.try_convert(1))
p(Regexp.try_convert(:ab))
a002 = /a/i; v002 = Regexp.try_convert(a002); p v002
a003 = "a"; v003 = Regexp.try_convert(a003); p v003
