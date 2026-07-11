# frozen_string_literal: true
# Hash#reject
p({ a: 1, b: 2 }.reject { |_k, v| v > 1 })
a056 = { a: 1, b: 2 }; p(a056.reject { |_k, v| v > 1 })
a057 = { a: 1, b: 2 }; c057 = (a057.reject { |_k, v| v > 1 }); p c057

# String keys, Integer values
p({ "x" => 10, "y" => 20, "z" => 5 }.reject { |_k, v| v >= 10 })
rsk1 = { "x" => 10, "y" => 20, "z" => 5 }; rsc1 = rsk1.reject { |_k, v| v >= 10 }; p rsc1

# Integer keys, key predicate
p({ 1 => "a", 2 => "b", 3 => "c" }.reject { |k, _v| k.odd? })
rik1 = { 1 => "a", 2 => "b", 3 => "c" }; ric1 = rik1.reject { |k, _v| k.odd? }; p ric1

# single-param block binds the KEY (not the [k,v] pair)
p({ 1 => 10, 2 => 20, 3 => 30 }.reject { |k| k > 1 })
rkf1 = { 1 => 10, 2 => 20, 3 => 30 }; rkc1 = rkf1.reject { |k| k > 1 }; p rkc1

# reject all
p({ a: 1, b: 2 }.reject { |_k, v| v > 0 })
rall1 = { a: 1, b: 2 }; rall2 = rall1.reject { |_k, v| v > 0 }; p rall2

# reject none
p({ a: 1, b: 2 }.reject { |_k, v| v > 100 })
rnone1 = { a: 1, b: 2 }; rnone2 = rnone1.reject { |_k, v| v > 100 }; p rnone2

emptyh_j = {}; p(emptyh_j.reject { |_k, v| v > 0 })
p({ a: 1, b: 2 }.reject.class)

# A value returned from a method with a `raise` branch loses much of its method
# table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_hj(ohj)
  case ohj
  when Integer then {"a" => 1}
  when String  then {"b" => 2}
  else raise ArgumentError, "no"
  end
end
rb_hj = (raisebr_hj("ab").reject { |_k, _v| false } rescue $!.class); p rb_hj

# Filtering a Proc-valued Hash with a block that calls the value emits ill-typed C.
# Kept commented: a compile abort takes down the whole file.
pv745 = { "x" => ->(v745) { v745 > 1 } }
p(pv745.reject { |_k745, c745| c745.call(3) }.keys)
r745 = pv745.reject { |_k746, c746| c746.call(3) }; p r745.keys

# On a Hash returned by a seedless Array#reduce.
a82rj = { n: 1, s: { x: 2 } }
h82rj = [a82rj].reduce { |acc82rj, l82rj| acc82rj }
r82rj = (h82rj.reject { |k82rj, v82rj| k82rj == :n } rescue $!.class); p r82rj
