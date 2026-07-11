# frozen_string_literal: true
# Hash#grep
# Refused before any C is emitted, taking down the whole file.
p({ a: 1, b: 2 }.grep(Array))
a002 = { a: 1, b: 2 }; p(a002.grep(Array))
a003 = { a: 1, b: 2 }; c003 = (a003.grep(Array)); p c003
a004 = { a: 1 }; c004 = (a004.grep(Array) { |pr004| pr004[0] }); p c004
