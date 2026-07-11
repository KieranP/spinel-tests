# frozen_string_literal: true
# Hash#collect_concat
p({ a: 1, b: 2 }.collect_concat { |k001, v001| [k001, v001] })
a002 = { a: 1, b: 2 }; p(a002.collect_concat { |k002, v002| [k002, v002] })
a003 = { a: 1, b: 2 }; c003 = (a003.collect_concat { |k003, v003| [k003, v003] }); p c003
a004 = { a: [1, 2], b: [3] }; c004 = (a004.collect_concat { |_k004, v004| v004 }); p c004
a005 = {}; c005 = (a005.collect_concat { |k005, _v005| [k005] }); p c005
