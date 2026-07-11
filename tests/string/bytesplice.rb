# frozen_string_literal: true
# String#bytesplice
# Integer (index, length, replacement) form works in Spinel:
a01 = +"hello"; a01.bytesplice(0, 2, "HE"); p a01
a02 = +"hello"; b02 = "XY"; a02.bytesplice(0, 2, b02); p a02
a03 = +"hello"; c03 = (a03.bytesplice(0, 2, "HE")); p c03
# replacement of a different length grows/shrinks the string
a05 = +"hello"; a05.bytesplice(0, 1, "XXX"); p a05
a06 = +"hello"; a06.bytesplice(0, 3, "x"); p a06
# a frozen receiver must raise
a07 = "hello"; r07 = (a07.bytesplice(0, 2, "HE") rescue $!.class); p r07
# Range index form (kept last: it raises at runtime and would suppress the rest)
a04 = +"hello"; a04.bytesplice(1..3, "___"); p a04
