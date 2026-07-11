# frozen_string_literal: true
# Hash#<
p({ a: 1 } < { a: 1, b: 2 })
v001 = ({ a: 1 } < { a: 1, b: 2 }); p(v001)
# proper-subset vs equal-hash boundary (equal is NOT a proper subset)
p({ a: 1, b: 2 } < { a: 1, b: 2 })
v101 = ({ a: 1, b: 2 } < { a: 1, b: 2 }); p v101
# receiver and argument in variables
la101 = { a: 1 }; lb101 = { a: 1, b: 2 }; p(la101 < lb101)
la102 = { a: 1 }; lb102 = { a: 1, b: 2 }; lc102 = (la102 < lb102); p lc102
# empty < empty
p({} < {})
v102 = ({} < {}); p v102
# empty < non-empty
p({} < { a: 1 })
v103 = ({} < { a: 1 }); p v103
# empty receiver via a variable compiles fine (contrast with the literal above)
h101 = {}; g101 = { a: 1 }; p(h101 < g101)
h102 = {}; g102 = { a: 1 }; i102 = (h102 < g102); p i102
# disjoint keys
p({ a: 1 } < { b: 2 })
v104 = ({ a: 1 } < { b: 2 }); p v104
# same key, different value -> not a subset
p({ a: 1 } < { a: 2, b: 3 })
v105 = ({ a: 1 } < { a: 2, b: 3 }); p v105
# String keys
p({ "a" => 1 } < { "a" => 1, "b" => 2 })
v106 = ({ "a" => 1 } < { "a" => 1, "b" => 2 }); p v106
# Integer keys
p({ 1 => "x" } < { 1 => "x", 2 => "y" })
v107 = ({ 1 => "x" } < { 1 => "x", 2 => "y" }); p v107
