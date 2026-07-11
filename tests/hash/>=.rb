# frozen_string_literal: true
# Hash#>=
p({ a: 1 } >= { a: 1, b: 2 })
v004 = ({ a: 1 } >= { a: 1, b: 2 }); p(v004)
# equal hashes ARE a superset (>=)
p({ a: 1 } >= { a: 1 })
v401 = ({ a: 1 } >= { a: 1 }); p v401
# proper superset
p({ a: 1, b: 2 } >= { a: 1 })
la401 = { a: 1, b: 2 }; lb401 = { a: 1 }; p(la401 >= lb401)
la402 = { a: 1, b: 2 }; lb402 = { a: 1 }; lc402 = (la402 >= lb402); p lc402
# empty >= empty
p({} >= {})
v402 = ({} >= {}); p v402
# non-empty >= empty
p({ a: 1 } >= {})
v403 = ({ a: 1 } >= {}); p v403
# empty argument via a variable compiles fine (contrast with the literal above)
h401 = { a: 1 }; g401 = {}; p(h401 >= g401)
h402 = { a: 1 }; g402 = {}; i402 = (h402 >= g402); p i402
# subset is not >= superset
p({ a: 1 } >= { a: 1, b: 2 })
v404 = ({ a: 1 } >= { a: 1, b: 2 }); p v404
# same key, different value
p({ a: 1 } >= { a: 2 })
v405 = ({ a: 1 } >= { a: 2 }); p v405
# String keys
p({ "a" => 1, "b" => 2 } >= { "a" => 1 })
v406 = ({ "a" => 1, "b" => 2 } >= { "a" => 1 }); p v406
# Integer keys
p({ 1 => "x" } >= { 1 => "x" })
v407 = ({ 1 => "x" } >= { 1 => "x" }); p v407
