# frozen_string_literal: true
# Hash#compare_by_identity?
p({ a: 1 }.compare_by_identity?)
a001 = { a: 1 }; p(a001.compare_by_identity?)
a002 = { a: 1 }; c002 = (a002.compare_by_identity?); p c002
p({ a: 1, b: 2 }.compare_by_identity?)
p({ "x" => 1 }.compare_by_identity?)
p({ 1 => "a" }.compare_by_identity?)
p({}.compare_by_identity?)
a003 = { a: 1, b: 2, c: 3 }; p(a003.compare_by_identity?)
a004 = { "k" => 9 }; c004 = (a004.compare_by_identity?); p c004
