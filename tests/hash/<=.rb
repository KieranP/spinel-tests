# frozen_string_literal: true
# Hash#<=
p({ a: 1, b: 2 } <= { a: 1, b: 2 })
v002 = ({ a: 1, b: 2 } <= { a: 1, b: 2 }); p(v002)
# equal hashes ARE a subset (<=)
p({ a: 1 } <= { a: 1 })
v201 = ({ a: 1 } <= { a: 1 }); p v201
# proper subset
p({ a: 1 } <= { a: 1, b: 2 })
la201 = { a: 1 }; lb201 = { a: 1, b: 2 }; p(la201 <= lb201)
la202 = { a: 1 }; lb202 = { a: 1, b: 2 }; lc202 = (la202 <= lb202); p lc202
# empty <= empty
p({} <= {})
v202 = ({} <= {}); p v202
# empty <= non-empty
p({} <= { a: 1 })
v203 = ({} <= { a: 1 }); p v203
# empty receiver via a variable compiles fine (contrast with the literal above)
h201 = {}; g201 = { a: 1 }; p(h201 <= g201)
h202 = {}; g202 = { a: 1 }; i202 = (h202 <= g202); p i202
# superset is not <= subset
p({ a: 1, b: 2 } <= { a: 1 })
v204 = ({ a: 1, b: 2 } <= { a: 1 }); p v204
# same key, different value
p({ a: 1 } <= { a: 2 })
v205 = ({ a: 1 } <= { a: 2 }); p v205
# String keys
p({ "a" => 1 } <= { "a" => 1, "b" => 2 })
v206 = ({ "a" => 1 } <= { "a" => 1, "b" => 2 }); p v206
# Integer keys
p({ 1 => "x" } <= { 1 => "x" })
v207 = ({ 1 => "x" } <= { 1 => "x" }); p v207
