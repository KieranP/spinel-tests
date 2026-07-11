# frozen_string_literal: true
# Hash#minmax_by
p({ a: 1, b: 2 }.minmax_by { |_k001, v001| v001 })
a002 = { a: 1, b: 2, c: 3 }; p(a002.minmax_by { |_k002, v002| v002 })
a003 = { a: 1, b: 2, c: 3 }; c003 = (a003.minmax_by { |_k003, v003| v003 }); p c003
a004 = { "a" => 3, "b" => 1 }; c004 = (a004.minmax_by { |k004, _v004| k004 }); p c004
a005 = { a: 1 }; c005 = (a005.minmax_by { |_k005, v005| v005 }); p c005
a006 = {}; c006 = (a006.minmax_by { |_k006, v006| v006 }); p c006
