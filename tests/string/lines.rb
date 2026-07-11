# frozen_string_literal: true
# String#lines
p("a\nb\nc\n".lines)
a001 = "a\nb\nc\n"; p(a001.lines)
a002 = "a\nb\nc\n"; v002 = a002.lines; p v002
# no trailing newline: last line has no separator
p("a\nb".lines)
# empty string -> empty array
p("".lines)
# a single line without newline
p("abc".lines)
# custom separator
p("a-b-c".lines("-"))
a003 = "a-b-c"; b003 = "-"; v003 = a003.lines(b003); p v003
# chomp: keyword strips the separators
p("a\nb\n".lines(chomp: true))
a004 = "a\nb\n"; v004 = a004.lines(chomp: true); p v004
p("a\n\nb\nc\n".lines(""))
z001 = "a\n\nb\nc\n"; v001 = z001.lines(""); p v001
r002 = ("1-2-3".lines("-", chomp: true) rescue $!.class); p r002
# separator with no trailing occurrence, and a multibyte separator
p("a☕b☕c".lines("☕"))
z003 = "a☕b☕c"; v003 = z003.lines("☕"); p v003
# chomp: on a string whose last line has no separator
p("a\nb".lines(chomp: true))
