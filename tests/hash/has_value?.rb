# frozen_string_literal: true
# Hash#has_value?
p({ a: 1 }.has_value?(1))
a001 = { a: 1 }; p(a001.has_value?(1))
a002 = { a: 1 }; b002 = 1; p(a002.has_value?(b002))
a003 = { a: 1 }; b003 = 1; c003 = (a003.has_value?(b003)); p c003
p({ a: 1, b: 2 }.has_value?(2))
p({ a: 1, b: 2 }.has_value?(9))
p({ "x" => "one", "y" => "two" }.has_value?("two"))
p({ "x" => "one", "y" => "two" }.has_value?("nope"))
p({ 1 => 1.5, 2 => 2.5 }.has_value?(2.5))
p({ 1 => 1.5, 2 => 2.5 }.has_value?(3.5))
p({}.has_value?(1))
a004 = { a: 1, b: 2, c: 3 }; p(a004.has_value?(3))
a005 = { "k" => 9 }; b005 = 9; p(a005.has_value?(b005))
a006 = { "k" => 9 }; b006 = 8; c006 = (a006.has_value?(b006)); p c006
a007 = { a: nil }; c007 = (a007.has_value?(nil)); p c007
a008 = { a: [1, 2], b: [3, 4] }; c008 = (a008.has_value?([3, 4])); p c008
