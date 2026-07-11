# frozen_string_literal: true
# Hash#each_key

out001 = []; { a: 1, b: 2 }.each_key { |k| out001 << k }; p out001
out002 = []; { "x" => 1, "y" => 2 }.each_key { |k| out002 << k }; p out002
out003 = []; { 1 => "one", 2 => "two" }.each_key { |k| out003 << k }; p out003
out004 = []; { a: 1 }.each_key { |k| out004 << k }; p out004

# return value is self
a001 = { a: 1, b: 2 }; r001 = a001.each_key { |_k| nil }; p r001
b001 = { "x" => 1.1, "y" => 2.2 }; ob001 = []; r002 = b001.each_key { |k| ob001 << k }; p ob001; p r002

# accumulate over integer keys
c001 = { 1 => "a", 2 => "b", 3 => "c" }; sum001 = 0; c001.each_key { |k| sum001 += k }; p sum001

# nested / mixed value types, symbol keys
d001 = { a: { x: 1 }, b: [1, 2], c: nil }; od001 = []; d001.each_key { |k| od001 << k }; p od001

# On a Hash returned by a seedless Array#reduce.
a82ek = { n: 1, s: { x: 2 } }
h82ek = [a82ek].reduce { |acc82ek, l82ek| acc82ek }
r82ek = (h82ek.each_key.to_a rescue $!.class); p r82ek

# As a method's implicit return value this yields a zero value of the receiver's
# type instead of the receiver itself.
def ir803(x803); x803.each_key { |k803| nil }; end
p ir803({ "a" => 1 })
v803 = ir803({ "a" => 1 }); p v803
# control: the same call with the result consumed explicitly
def ic803(y803); return y803.each_key { |k803| nil }; end
p ic803({ "a" => 1 })
