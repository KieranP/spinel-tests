# frozen_string_literal: true
# Hash#drop_while
# Refused before any C is emitted, taking down the whole file.
p({ a: 1, b: 2, c: 3 }.drop_while { |_k001, v001| v001 < 3 })
a002 = { a: 1, b: 2, c: 3 }; p(a002.drop_while { |_k002, v002| v002 < 3 })
a003 = { a: 1, b: 2, c: 3 }; c003 = (a003.drop_while { |_k003, v003| v003 < 3 }); p c003
a004 = { 1 => "x", 2 => "y" }; c004 = (a004.drop_while { |k004, _v004| k004 < 2 }); p c004
