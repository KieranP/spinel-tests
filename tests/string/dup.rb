# frozen_string_literal: true
# String#dup
p("abc".dup.class)
a037 = "abc"; b037 = a037.dup; p(b037.class)
a038 = "abc"; v038 = a038.dup; p(v038 == a038)
# dup is a distinct object with equal content
a039 = "abc"; b039 = a039.dup; p(b039.equal?(a039))
# mutating the dup does not affect the original
a040 = "abc"; b040 = a040.dup; b040 << "d"; p a040; p b040
# dup of a frozen string is NOT frozen (unlike clone)
a041 = "abc".freeze; b041 = a041.dup; p(b041.frozen?)
a042 = "abc".freeze; v042 = (a042.dup.frozen?); p v042
# dup of a frozen string is mutable
a043 = "abc".freeze; b043 = a043.dup; b043 << "d"; p b043
# empty and multibyte
p("".dup)
p("café".dup)
