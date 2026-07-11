# frozen_string_literal: true
# Hash#chunk
p({ a: 1, b: 2, c: 3 }.chunk { |_k001, v001| v001.odd? }.to_a)
a002 = { a: 1, b: 2, c: 3 }; p(a002.chunk { |_k002, v002| v002.odd? }.to_a)
a003 = { a: 1, b: 2, c: 3 }; c003 = (a003.chunk { |_k003, v003| v003.odd? }.to_a); p c003
a004 = { "a" => 1, "b" => 1, "c" => 2 }; c004 = (a004.chunk { |_k004, v004| v004 }.to_a); p c004
a005 = {}; c005 = (a005.chunk { |_k005, v005| v005 }.to_a); p c005
