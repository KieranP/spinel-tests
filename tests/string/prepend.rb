# frozen_string_literal: true
# String#prepend
p((+"cd").prepend("ab"))
a091 = +"cd"; a091.prepend("ab"); p a091
a092 = +"cd"; b092 = +"ab"; a092.prepend(b092); p a092
a093 = +"cd"; b093 = +"ab"; c093 = (a093.prepend(b093)); p c093
# multiple arguments, prepended in order
p((+"c").prepend("a", "b"))
a094 = +"c"; a094.prepend("a", "b"); p a094
# zero arguments is a no-op returning the receiver; a frozen receiver still raises
a095 = +"ab"; r095 = (a095.prepend rescue $!.class); p r095
r096 = ("ab".prepend rescue $!.class); p r096
# direct form (kept last: it raises at runtime and would suppress the rest)
p((+"ab").prepend)
