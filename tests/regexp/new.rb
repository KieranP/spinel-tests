# frozen_string_literal: true
# Regexp.new
p(Regexp.new("ab").source)
p(Regexp.new("a+").match?("baaa"))
p(Regexp.new("ab", 1).match?("AB"))
a001 = Regexp.new("a+"); p(a001.match("baaa")[0])
a002 = Regexp.new("ab"); v002 = a002.source; p v002

# Constructing from an existing Regexp (a copy)
p(Regexp.new(/ab/).source)
b001 = Regexp.new(/ab/i); p(b001.source)

# Regexp.new with the IGNORECASE options constant
p(Regexp.new("ab", Regexp::IGNORECASE).match?("AB"))
p(Regexp.new("ab", Regexp::IGNORECASE).options)
a003 = Regexp.new("ab", Regexp::IGNORECASE); v003 = (a003.options); p v003

# Regexp.new with the MULTILINE / EXTENDED options constants
p(Regexp.new("a.b", Regexp::MULTILINE).match?("a\nb"))
p(Regexp.new("a b", Regexp::EXTENDED).match?("ab"))
p(Regexp.new("a.b", Regexp::MULTILINE).options)
p(Regexp.new("a b", Regexp::EXTENDED).options)
a004 = Regexp.new("a.b", Regexp::MULTILINE); v004 = (a004.options); p v004

# an invalid pattern raises RegexpError
r005 = (Regexp.new("(") rescue $!.class); p r005
r006 = (Regexp.new("[") rescue $!.class); p r006

# A Regexp.new pattern whose #match receives an untyped argument at one call site
# fails to compile. Kept commented: a compile abort takes down the file.
RE831 = Regexp.new("\\A(?<id>\\d+)\\z")
def m831(path831) = RE831.match(path831)
EMPTY831 = [].freeze
EMPTY831.each { |p831| p m831(p831) }
p(m831("42")[:id])
v831 = m831("42")[:id]; p v831

# Options carried over from an existing Regexp, and combined flag constants
p(Regexp.new(/ab/i).options)
p(Regexp.new("ab", Regexp::IGNORECASE | Regexp::MULTILINE).options)
p(Regexp.new("a b", Regexp::EXTENDED | Regexp::IGNORECASE).match?("AB"))
a007 = Regexp.new(/a.b/m); v007 = a007.options; p v007

# nil / true in the options slot
p(Regexp.new("ab", nil).options)
p(Regexp.new("ab", true).options)
a008 = Regexp.new("ab", nil); v008 = a008.match?("AB"); p v008

# Named groups survive the round trip
p(Regexp.new("(?<a>x)(?<b>y)").names)
p(Regexp.new("(?<a>\\d+)").match("42")[:a])
a009 = Regexp.new("(?<a>\\d+)"); v009 = a009.named_captures; p v009

# A Regexp.new pattern is eql? to the identical literal
p(Regexp.new("ab").eql?(/ab/))
a010 = Regexp.new("ab"); v010 = (a010.hash == /ab/.hash); p v010
