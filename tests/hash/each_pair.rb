# frozen_string_literal: true
# Hash#each_pair
p({ a: 1, b: 2 }.each_pair { |_k, _v| nil })
a311 = { a: 1, b: 2 }; c311 = (a311.each_pair { |_k, _v| nil }); p c311
a312 = { a: 1, b: 2 }; out312 = []; a312.each_pair { |k, v| out312 << [k, v] }; p out312
# return value is the receiver itself (identity preserved)
ep01 = { a: 1, b: 2 }; p(ep01.each_pair { |_k, _v| nil }.equal?(ep01))
# collect pairs from a direct literal
out313 = []; { a: 1, b: 2, c: 3 }.each_pair { |k, v| out313 << [k, v] }; p out313
# String keys
ep02 = { "a" => 1, "b" => 2 }; out314 = []; ep02.each_pair { |k, v| out314 << [k, v] }; p out314
# Integer keys
ep03 = { 1 => "x", 2 => "y" }; out315 = []; ep03.each_pair { |k, v| out315 << [k, v] }; p out315
# single entry
ep04 = { z: 9 }; out316 = []; ep04.each_pair { |k, v| out316 << [k, v] }; p out316
# empty hash: block never runs, returns the receiver
ep05 = {}; out317 = []; ep05.each_pair { |k, v| out317 << [k, v] }; p out317

# A value returned from a method with a `raise` branch loses much of its method
# table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_hp(ohp)
  case ohp
  when Integer then {"a" => 1}
  when String  then {"b" => 2}
  else raise ArgumentError, "no"
  end
end
rb_hp = (raisebr_hp("ab").each_pair.to_a rescue $!.class); p rb_hp

# On a Hash returned by a seedless Array#reduce.
a82ep = { n: 1, s: { x: 2 } }
h82ep = [a82ep].reduce { |acc82ep, l82ep| acc82ep }
r82ep = (h82ep.each_pair.to_a rescue $!.class); p r82ep

# As a method's implicit return value this yields a zero value of the receiver's
# type instead of the receiver itself.
def ir802(x802); x802.each_pair { |k802, v802| nil }; end
p ir802({ "a" => 1 })
v802 = ir802({ "a" => 1 }); p v802
# control: the same call with the result consumed explicitly
def ic802(y802); return y802.each_pair { |k802, v802| nil }; end
p ic802({ "a" => 1 })
