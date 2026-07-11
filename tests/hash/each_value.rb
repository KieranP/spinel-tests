# frozen_string_literal: true
# Hash#each_value

out001 = []; { a: 1, b: 2 }.each_value { |v| out001 << v }; p out001
out002 = []; { "x" => 10, "y" => 20 }.each_value { |v| out002 << v }; p out002
out003 = []; { 1 => "one", 2 => "two" }.each_value { |v| out003 << v }; p out003
out004 = []; { a: 1 }.each_value { |v| out004 << v }; p out004

# return value is self
a001 = { a: 1, b: 2 }; r001 = a001.each_value { |_v| nil }; p r001
b001 = { "x" => 1.1, "y" => 2.2 }; ob001 = []; r002 = b001.each_value { |v| ob001 << v }; p ob001; p r002

# accumulate over integer values
c001 = { a: 10, b: 20, c: 30 }; sum001 = 0; c001.each_value { |v| sum001 += v }; p sum001

# nested / mixed value types
d001 = { a: [1, 2], b: [3] }; od001 = []; d001.each_value { |v| od001 << v }; p od001

# On a Hash returned by a seedless Array#reduce.
a82ev = { n: 1, s: { x: 2 } }
h82ev = [a82ev].reduce { |acc82ev, l82ev| acc82ev }
r82ev = (h82ev.each_value.to_a rescue $!.class); p r82ev

# As a method's implicit return value this yields a zero value of the receiver's
# type instead of the receiver itself.
def ir804(x804); x804.each_value { |v804| nil }; end
p ir804({ "a" => 1 })
v804 = ir804({ "a" => 1 }); p v804
# control: the same call with the result consumed explicitly
def ic804(y804); return y804.each_value { |v804| nil }; end
p ic804({ "a" => 1 })
