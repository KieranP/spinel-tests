# frozen_string_literal: true
# Hash#key?
p({ a: 1 }.key?(:a))
a034 = { a: 1 }; p(a034.key?(:a))
a035 = { a: 1 }; b035 = :a; p(a035.key?(b035))
a036 = { a: 1 }; b036 = :a; c036 = (a036.key?(b036)); p c036
p({ a: 1, b: 2 }.key?(:b))
p({ a: 1, b: 2 }.key?(:z))
p({ "x" => 1, "y" => 2 }.key?("x"))
p({ "x" => 1, "y" => 2 }.key?("z"))
p({ 1 => "a", 2 => "b" }.key?(1))
p({ 1 => "a", 2 => "b" }.key?(3))
p({}.key?(:a))
a037 = { a: 1, b: 2, c: 3 }; p(a037.key?(:c))
a038 = { "k" => 9 }; b038 = "k"; p(a038.key?(b038))
a039 = { "k" => 9 }; b039 = "missing"; c039 = (a039.key?(b039)); p c039
a040 = { 10 => "x", 20 => "y" }; b040 = 30; c040 = (a040.key?(b040)); p c040
a041 = { a: nil }; c041 = (a041.key?(:a)); p c041
