# frozen_string_literal: true
# Hash#==
p({ a: 1, b: 2 } == { b: 2, a: 1 })
a337 = { a: 1 }; b337 = { a: 1 }; p(a337 == b337)
a338 = { a: 1 }; b338 = { a: 2 }; c338 = (a338 == b338); p c338
# order-independence, captured form
p({ a: 1, b: 2 } == { b: 2, a: 1 })
v501 = ({ a: 1, b: 2 } == { b: 2, a: 1 }); p v501
# different sizes
p({ a: 1 } == { a: 1, b: 2 })
v502 = ({ a: 1 } == { a: 1, b: 2 }); p v502
# nested-hash equality
p({ a: { b: 1 } } == { a: { b: 1 } })
v503 = ({ a: { b: 1 } } == { a: { b: 1 } }); p v503
# nested-hash inequality
p({ a: { b: 1 } } == { a: { b: 2 } })
v504 = ({ a: { b: 1 } } == { a: { b: 2 } }); p v504
# empty == empty
p({} == {})
v505 = ({} == {}); p v505
# empty == non-empty
p({} == { a: 1 })
v506 = ({} == { a: 1 }); p v506
# value-type mismatch: Integer 1 vs Float 1.0 (Hash#== uses ==, so equal)
p({ a: 1 } == { a: 1.0 })
v507 = ({ a: 1 } == { a: 1.0 }); p v507
# String keys, equal
p({ "a" => 1 } == { "a" => 1 })
v508 = ({ "a" => 1 } == { "a" => 1 }); p v508
# Integer keys, equal
p({ 1 => "x", 2 => "y" } == { 2 => "y", 1 => "x" })
v509 = ({ 1 => "x", 2 => "y" } == { 2 => "y", 1 => "x" }); p v509
# self-comparison
sa501 = { a: 1, b: 2 }; p(sa501 == sa501)
sa502 = { a: 1, b: 2 }; sc502 = (sa502 == sa502); p sc502
