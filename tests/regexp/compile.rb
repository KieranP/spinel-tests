# frozen_string_literal: true
# Regexp.compile
p(Regexp.compile("a+").source)
p(Regexp.compile("a+").match?("baaa"))
a001 = Regexp.compile("a+"); p(a001.match("baaa")[0])
a002 = Regexp.compile("a+"); v002 = a002.source; p v002

# Regexp.compile with the options argument, and from an existing Regexp
p(Regexp.compile("ab", Regexp::IGNORECASE).match?("AB"))
p(Regexp.compile("a.b", Regexp::MULTILINE).match?("a\nb"))
# A Regexp argument. Kept commented: it compiles with an incompatible-pointer warning.
p(Regexp.compile(/ab/i).source)
a006 = Regexp.compile(/ab/i); v006 = a006.options; p v006
a003 = Regexp.compile("(?<n>\\d+)"); p(a003.match("42")[:n])
a004 = Regexp.compile("ab", Regexp::IGNORECASE); v004 = a004.options; p v004

# An invalid pattern raises RegexpError
r005 = (Regexp.compile("(") rescue $!.class); p r005
