# frozen_string_literal: true
# Hash#>
p({ a: 1, b: 2 } > { a: 1 })
v003 = ({ a: 1, b: 2 } > { a: 1 }); p(v003)
# proper-superset vs equal-hash boundary (equal is NOT a proper superset)
p({ a: 1, b: 2 } > { a: 1, b: 2 })
v301 = ({ a: 1, b: 2 } > { a: 1, b: 2 }); p v301
# receiver and argument in variables
la301 = { a: 1, b: 2 }; lb301 = { a: 1 }; p(la301 > lb301)
la302 = { a: 1, b: 2 }; lb302 = { a: 1 }; lc302 = (la302 > lb302); p lc302
# empty > empty
p({} > {})
v302 = ({} > {}); p v302
# non-empty > empty
p({ a: 1 } > {})
v303 = ({ a: 1 } > {}); p v303
# empty argument via a variable compiles fine (contrast with the literal above)
h301 = { a: 1 }; g301 = {}; p(h301 > g301)
h302 = { a: 1 }; g302 = {}; i302 = (h302 > g302); p i302
# disjoint keys
p({ a: 1 } > { b: 2 })
v304 = ({ a: 1 } > { b: 2 }); p v304
# same key, different value -> not a superset
p({ a: 2, b: 3 } > { a: 1 })
v305 = ({ a: 2, b: 3 } > { a: 1 }); p v305
# String keys
p({ "a" => 1, "b" => 2 } > { "a" => 1 })
v306 = ({ "a" => 1, "b" => 2 } > { "a" => 1 }); p v306
# Integer keys
p({ 1 => "x", 2 => "y" } > { 1 => "x" })
v307 = ({ 1 => "x", 2 => "y" } > { 1 => "x" }); p v307
