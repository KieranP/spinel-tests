# frozen_string_literal: true
# Regexp#match?
p("hello".match?(/l+/))
p("Hello".match?(/hello/i))
a008 = "hello"; b008 = /l+/; c008 = (a008.match?(b008)); p c008

# Regexp#match? (Regexp receiver)
p(/l+/.match?("hello"))
p(/xyz/.match?("hello"))
a020 = /l+/; p(a020.match?("hello"))
a021 = /l+/; b021 = "hello"; c021 = (a021.match?(b021)); p c021

# Regexp#match? with a start position
p(/l/.match?("hello", 3))

# match? with the /m (dot matches newline) and /x (extended) flags
p("a\nb".match?(/a.b/m))
p("a\nb".match?(/a.b/))
p("abc".match?(/ a b c /x))
a030 = "a\nb"; v030 = (a030.match?(/a.b/m)); p v030

# match? with anchors
p("hello world".match?(/\Ahello/))
p("hello world".match?(/\Aworld/))
a031 = "hello world"; v031 = (a031.match?(/world\z/)); p v031

# match? with lookahead / lookbehind
p("foo123".match?(/foo(?=\d)/))
p("$100".match?(/(?<=\$)\d+/))
a032 = "foobar"; v032 = (a032.match?(/foo(?!\d)/)); p v032

# match? does not set the match globals
"xyz".match?(/y/); p($~)
a033 = "xyz".match?(/y/); v033 = $~; p v033

# match? with a position: negative counts from the end, past the end is false
p(/l/.match?("hello", -2))
p(/l/.match?("hello", 9))
p("hello".match?(/l/, 4))
a034 = "hello"; v034 = (/l/.match?(a034, 3)); p v034

# match? leaves the globals from an earlier successful match untouched
"abc" =~ /(b)/
"xyz".match?(/y/)
p $1
p $~[0]

# A literal nil subject answers false. Kept commented: the build aborts with no message.
p(/a/.match?(nil))
v035 = /a/.match?(nil); p v035
p([/b/].map { |re104| re104.match?("abc") })
v105 = [/b/].map { |re105| re105.match?("abc") }; p v105
f106 = ->(re106, v106) { v106.match?(re106) }; p f106.call(/b/, "abc")
f107 = ->(re107, v107) { v107.match?(re107) }; v107b = f107.call(/b/, "abc"); p v107b
# String's methods too
p([/b/].map { |re110| "abc".match?(re110) })
v111 = [/b/].map { |re111| "abc".match?(re111) }; p v111
