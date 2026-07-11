# frozen_string_literal: true
# Hash#has_key?
p({ a: 1 }.has_key?(:a))
a001 = { a: 1 }; p(a001.has_key?(:a))
a002 = { a: 1 }; b002 = :a; p(a002.has_key?(b002))
a003 = { a: 1 }; b003 = :a; c003 = (a003.has_key?(b003)); p c003
p({ a: 1, b: 2 }.has_key?(:b))
p({ a: 1, b: 2 }.has_key?(:z))
p({ "x" => 1, "y" => 2 }.has_key?("x"))
p({ "x" => 1, "y" => 2 }.has_key?("z"))
p({ 1 => "a", 2 => "b" }.has_key?(1))
p({ 1 => "a", 2 => "b" }.has_key?(3))
p({}.has_key?(:a))
a004 = { a: 1, b: 2, c: 3 }; p(a004.has_key?(:c))
a005 = { "k" => 9 }; b005 = "k"; p(a005.has_key?(b005))
a006 = { "k" => 9 }; b006 = "missing"; c006 = (a006.has_key?(b006)); p c006
a007 = { 10 => "x", 20 => "y" }; b007 = 30; c007 = (a007.has_key?(b007)); p c007
a008 = { a: nil }; c008 = (a008.has_key?(:a)); p c008
