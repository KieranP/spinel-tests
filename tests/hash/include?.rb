# frozen_string_literal: true
# Hash#include?
p({ a: 1 }.include?(:a))
a001 = { a: 1 }; p(a001.include?(:a))
a002 = { a: 1 }; b002 = :a; p(a002.include?(b002))
a003 = { a: 1 }; b003 = :a; c003 = (a003.include?(b003)); p c003
p({ a: 1, b: 2 }.include?(:b))
p({ a: 1, b: 2 }.include?(:z))
p({ "x" => 1, "y" => 2 }.include?("x"))
p({ "x" => 1, "y" => 2 }.include?("z"))
p({ 1 => "a", 2 => "b" }.include?(1))
p({ 1 => "a", 2 => "b" }.include?(3))
p({}.include?(:a))
a004 = { a: 1, b: 2, c: 3 }; p(a004.include?(:c))
a005 = { "k" => 9 }; b005 = "k"; p(a005.include?(b005))
a006 = { "k" => 9 }; b006 = "missing"; c006 = (a006.include?(b006)); p c006
a007 = { 10 => "x", 20 => "y" }; b007 = 30; c007 = (a007.include?(b007)); p c007
a008 = { a: nil }; c008 = (a008.include?(:a)); p c008
