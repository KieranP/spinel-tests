# frozen_string_literal: true
# Hash#grep_v
# Refused before any C is emitted, taking down the whole file.
p({ a: 1, b: 2 }.grep_v(Array))
a002 = { a: 1, b: 2 }; p(a002.grep_v(Array))
a003 = { a: 1, b: 2 }; c003 = (a003.grep_v(Array)); p c003
a004 = { a: 1 }; c004 = (a004.grep_v(String)); p c004
