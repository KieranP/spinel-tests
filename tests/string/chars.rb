# frozen_string_literal: true
# String#chars
p("abc".chars)
a028 = "abc"; p(a028.chars)
a029 = "abc"; c029 = (a029.chars); p c029
# empty string
p("".chars)
a030 = ""; c030 = (a030.chars); p c030
# multibyte: one entry per grapheme-less codepoint
p("héllo".chars)
p("a☕b".chars)
a031 = "héllo"; c031 = (a031.chars); p c031
# length and last element
p("abc".chars.length)
p("abc".chars.last)
a032 = "abc"; c032 = (a032.chars.first); p c032
# whitespace and repeated characters are preserved
p("a a".chars)
p("aaa".chars)

# String#chars on a String destructured from an Array of pairs, printed directly (was bug 20260718151631016, fixed)
[["ab", "cd"]].each { |a016, b016| p a016.chars }
r016 = [["ab", "cd"]].map { |a016b, b016b| a016b.chars }; p r016

# embedded NUL: one entry per byte, NUL included
p("a\0b".chars)
a033ch = "a\0b"; c033ch = a033ch.chars; p c033ch
