# frozen_string_literal: true
# Hash#member?
p({ a: 1 }.member?(:a))
a001 = { a: 1 }; p(a001.member?(:a))
a002 = { a: 1 }; b002 = :a; p(a002.member?(b002))
a003 = { a: 1 }; b003 = :a; c003 = (a003.member?(b003)); p c003
p({ a: 1, b: 2 }.member?(:b))
p({ a: 1, b: 2 }.member?(:z))
p({ "x" => 1, "y" => 2 }.member?("x"))
p({ "x" => 1, "y" => 2 }.member?("z"))
p({ 1 => "a", 2 => "b" }.member?(1))
p({ 1 => "a", 2 => "b" }.member?(3))
p({}.member?(:a))
a004 = { a: 1, b: 2, c: 3 }; p(a004.member?(:c))
a005 = { "k" => 9 }; b005 = "k"; p(a005.member?(b005))
a006 = { "k" => 9 }; b006 = "missing"; c006 = (a006.member?(b006)); p c006
a007 = { 10 => "x", 20 => "y" }; b007 = 30; c007 = (a007.member?(b007)); p c007
a008 = { a: nil }; c008 = (a008.member?(:a)); p c008
