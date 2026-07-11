# frozen_string_literal: true
# Hash#map
p({ a: 1, b: 2 }.map { |k, v| "#{k}=#{v}" })
a039 = { a: 1, b: 2 }; p(a039.map { |k, v| "#{k}=#{v}" })
a040 = { a: 1, b: 2 }; c040 = (a040.map { |k, v| "#{k}=#{v}" }); p c040

p({ a: 1, b: 2 }.map { |pair| pair })
a041 = { a: 1, b: 2 }; c041 = (a041.map { |pair| pair }); p c041

# String keys, transform values
p({ "x" => 10, "y" => 20 }.map { |_k, v| v * 2 })
mv1 = { "x" => 10, "y" => 20 }; mv2 = mv1.map { |_k, v| v * 2 }; p mv2

# keys only
p({ a: 1, b: 2, c: 3 }.map { |k, _v| k })
mk1 = { a: 1, b: 2, c: 3 }; mk2 = mk1.map { |k, _v| k }; p mk2

# Integer keys, produce pairs
p({ 1 => "a", 2 => "b" }.map { |k, v| [k, v] })
mi1 = { 1 => "a", 2 => "b" }; mi2 = mi1.map { |k, v| [k, v] }; p mi2

# single-param binds the full [k,v] pair -> index it
p({ a: 1, b: 2 }.map { |pair| pair[0] })
mp1 = { a: 1, b: 2 }; mp2 = mp1.map { |pair| pair[0] }; p mp2

# empty hash: the variable form works (map returns an Array), the literal raises
me1 = {}; p(me1.map { |k, _v| k })
mlit0 = ({}.map { |k, _v| k } rescue "unknown"); p mlit0

p({ a: 1, b: 2 }.map.class)
p({ a: 1, b: 2 }.map { |_k, _v| nil })

def render231(v231); return v231.to_s unless v231.is_a?(Hash); v231.map { |k231, x231| "#{k231}:#{render231(x231)}" }.join(","); end
p render231({ "a" => 1, "b" => 2 })
r231 = render231({ "a" => 1, "b" => 2 }); p r231
