# frozen_string_literal: true
# Regexp#match
p("hello".match(/l+/)[0])
a005 = "hello"; p(a005.match(/l+/)[0])
a006 = "hello"; b006 = /l+/; c006 = (a006.match(b006)[0]); p c006

# Regexp#match (captures)
p("2024-01-15".match(/(\d+)-(\d+)-(\d+)/).captures)
a007 = "2024-01-15"; p(a007.match(/(\d+)-(\d+)-(\d+)/).captures)

# MatchData#string
p "hello".match(/l/).string
a008 = "hello"; b008 = (a008.match(/l/).string); p b008

# Regexp#match (Regexp receiver)
p(/l+/.match("hello")[0])
p(/(\d+)-(\d+)/.match("12-34").captures)
p(/xyz/.match("hello"))
a020 = /l+/; p(a020.match("hello")[0])
a021 = /l+/; b021 = "hello"; c021 = (a021.match(b021)[0]); p c021

# Regexp#match with a start position
p(/l/.match("hello", 3)[0])

# match with a block yields the MatchData
p("hello".match(/l+/) { |m001| m001[0].upcase })
a030 = "hello"; v030 = (a030.match(/l+/) { |m002| m002[0].upcase }); p v030

# no match returns nil
p("abc".match(/z/))
a031 = "abc"; v031 = (a031.match(/z/)); p v031

# flags: /i case-insensitive, /m dot matches newline, /x extended
p("HELLO".match(/hello/i)[0])
p("a\nb".match(/a.b/m)[0])
p("abc".match(/ a b c /x)[0])
a032 = "HELLO"; v032 = (a032.match(/hello/i)[0]); p v032

# anchors \A \z \Z \b
p("hello world".match(/\Ahello/)[0])
p("hello\n".match(/hello\z/))
p("hello\n".match(/hello\Z/)[0])
p("foo bar".match(/\bbar\b/)[0])
a033 = "hello\n"; v033 = (a033.match(/hello\z/)); p v033

# character classes \d \S [range] negation
p("a1b2".match(/\d/)[0])
p("  x".match(/\S/)[0])
p("abc123".match(/[a-c]+/)[0])
p("abc123".match(/[^a-c]+/)[0])
a034 = "abc123"; v034 = (a034.match(/[^a-c]+/)[0]); p v034

# quantifiers: greedy vs lazy, {n}, {n,m}, ?
p("<a><b>".match(/<.+>/)[0])
p("<a><b>".match(/<.+?>/)[0])
p("aaaa".match(/a{2}/)[0])
p("aaaa".match(/a{2,3}/)[0])
p("colour".match(/colou?r/)[0])
a035 = "<a><b>"; v035 = (a035.match(/<.+?>/)[0]); p v035

# groups: non-capturing, named, backreference
p("abab".match(/(?:ab)+/)[0])
p("hello".match(/(?<first>h)(?<rest>ello)/)[:rest])
p("hello".match(/(l)\1/)[0])
p("abcabc".match(/(?<x>abc)\k<x>/)[0])
a036 = "hello"; v036 = (a036.match(/(?<first>h)(?<rest>ello)/)[:rest]); p v036

# alternation
p("cat dog".match(/cat|dog/)[0])
a037 = "cat dog"; v037 = (a037.match(/dog|cat/)[0]); p v037

# lookahead (?=) (?!) and lookbehind (?<=) (?<!)
p("foo123".match(/foo(?=\d)/)[0])
p("foobar".match(/foo(?!\d)/)[0])
p("$100".match(/(?<=\$)\d+/)[0])
p("foobar".match(/(?<!\d)bar/)[0])
a038 = "$100"; v038 = (a038.match(/(?<=\$)\d+/)[0]); p v038

# MatchData accessors: pre_match, post_match, begin, end, offset, values_at, size
m003 = "2024-01-15".match(/(?<y>\d+)-(?<mo>\d+)-(?<d>\d+)/)
p m003.pre_match
p m003.post_match
p m003.begin(0)
p m003.end(0)
p m003.offset(1)
p m003.values_at(1, 3)
p m003.size
p m003.to_a
p m003["y"]
p m003[:d]

# unicode / multibyte receiver
p("héllo wörld".match(/l+o/)[0])
a039 = "café"; v039 = (a039.match(/é/)[0]); p v039

# Regexp#match on a Regexp.new pattern stops compiling once any call site passes an
# argument with no inferred type. Kept commented: a compile abort takes down the file.
RE821 = Regexp.new("\\A(?<id>\\d+)\\z")
def m821(path821) = RE821.match(path821)
EMPTY821 = [].freeze
EMPTY821.each { |p821| p m821(p821) }
p(m821("42")[:id])
v821 = m821("42")[:id]; p v821

# match with a block answers the block's value, not the MatchData
p(/a/.match("bab") { |m040| m040.begin(0) })
a040 = /(a)/; v040 = a040.match("bab") { |m041| m041[1] }; p v040
p(/z/.match("bab") { |m042| m042.begin(0) })

# match with a position: negative counts from the end, past the end is nil
p(/l/.match("hello", -2)[0])
p(/l/.match("hello", 9))
p(/l/.match("hello", 5))
a043 = "hello"; v043 = (/l/.match(a043, 3)[0]); p v043

# \G anchors at the search start; \g<name> calls a named subexpression
p("foo".match(/\Gfoo/))
a044 = "abcabc"; v044 = a044.match(/(?<x>abc)\g<x>/); p v044

# POSIX bracket classes and inline option groups
p("abc123".match(/[[:alpha:]]+/)[0])
p("abc 123".match(/[[:digit:]]+/)[0])
p("ABC".match(/(?i)abc/)[0])
p("aBC".match(/a(?i:bc)/)[0])
a045 = "abc123"; v045 = (a045.match(/[[:alnum:]]+/)[0]); p v045

# ^ and $ are line anchors, \A and \z are string anchors
p("line1\nline2".match(/^line2/)[0])
p("line1\nline2".match(/line1$/)[0])
p("line1\nline2".match(/\Aline2/))
a046 = "line1\nline2"; v046 = (a046.match(/^line2$/)[0]); p v046

# A literal nil subject answers nil. Kept commented: the build aborts with no message.
p(/a/.match(nil))
v047 = /a/.match(nil); p v047

# An atomic group / possessive quantifier. Kept commented: the binary segfaults, so
# every later line of the file is lost.
p("aaa".match(/(?>a+)a/))
v048 = "aaa".match(/a++a/); p v048
