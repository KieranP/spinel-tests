# frozen_string_literal: true
# Hash#each_with_object
p({ a: 1, b: 2 }.each_with_object([]) { |(k, _v), acc| acc << k })
a016 = { a: 1, b: 2 }; p(a016.each_with_object([]) { |(k, _v), acc| acc << k })
a017 = { a: 1, b: 2 }; c017 = (a017.each_with_object([]) { |(k, _v), acc| acc << k }); p c017
# accumulate into a Hash (invert the pairs)
p({ a: 1, b: 2 }.each_with_object({}) { |(k, v), acc| acc[v] = k })
ewo01 = { a: 1, b: 2 }; ewo01r = (ewo01.each_with_object({}) { |(k, v), acc| acc[v] = k }); p ewo01r
# accumulate the values into an array
p({ a: 1, b: 2, c: 3 }.each_with_object([]) { |(_k, v), acc| acc << v })
ewo02 = { a: 1, b: 2, c: 3 }; ewo02r = (ewo02.each_with_object([]) { |(_k, v), acc| acc << v }); p ewo02r
# String keys, accumulate into a String (the memo must be mutable; a literal is frozen)
p({ "a" => 1, "b" => 2 }.each_with_object(+"") { |(k, _v), acc| acc << k })
ewo03 = { "a" => 1, "b" => 2 }; ewo03r = (ewo03.each_with_object(+"") { |(k, _v), acc| acc << k }); p ewo03r
# empty hash -> memo returned unchanged
p({}.each_with_object([]) { |(k, _v), acc| acc << k })
ewo04 = {}; ewo04r = (ewo04.each_with_object([]) { |(k, _v), acc| acc << k }); p ewo04r
# invert into a Hash memo whose keys are the original values (stringified)
ewo05 = { a: 1, b: 2, c: 3 }; ewo05r = ewo05.each_with_object({}) { |(k, v), acc| acc[v] = k.to_s }; p ewo05r
# group original keys by value into a Hash-of-Arrays memo built with a default block
ewo06 = { a: 1, b: 2, c: 1 }; ewo06r = ewo06.each_with_object(Hash.new { |h, k| h[k] = [] }) { |(k, v), acc| acc[v] << k }; p ewo06r.transform_values(&:sort).sort.to_h

def parse349(qs); qs.split("&").each_with_object({}) { |pr, h| k, v = pr.split("="); (h[k] ||= []) << v }; end
def build349(params); params.flat_map { |k, vs| vs.map { |v| "#{k}=#{v}" } }.join("&"); end
puts build349(parse349("a=1&b=2"))
p build349({ "q" => ["ruby"] })

# On a Hash returned by a seedless Array#reduce.
a82ew = { n: 1, s: { x: 2 } }
h82ew = [a82ew].reduce { |acc82ew, l82ew| acc82ew }
r82ew = (h82ew.each_with_object([]) { |(k82ew, v82ew), acc| acc << k82ew } rescue $!.class); p r82ew

# an empty container memo the block never populates
p({ a: 1 }.each_with_object([]) { |x840, a840| a840 })
v841 = { a: 1 }.each_with_object([]) { |x841, a841| a841 }; p v841
p({ a: 1 }.each_with_object({}) { |x842, a842| a842 })
# Control: a non-empty memo and a scalar memo compile.
p({ a: 1 }.each_with_object([1]) { |x843, a843| a843 })
v844 = { a: 1 }.each_with_object(0) { |x844, a844| a844 }; p v844
