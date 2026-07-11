# frozen_string_literal: true
# Hash#select
p({ a: 1, b: 2 }.select { |_k, v| v > 1 })
a058 = { a: 1, b: 2 }; p(a058.select { |_k, v| v > 1 })
a059 = { a: 1, b: 2 }; c059 = (a059.select { |_k, v| v > 1 }); p c059

# String keys, Integer values
p({ "x" => 10, "y" => 20, "z" => 5 }.select { |_k, v| v >= 10 })
ssk1 = { "x" => 10, "y" => 20, "z" => 5 }; ssc1 = ssk1.select { |_k, v| v >= 10 }; p ssc1

# Integer keys, key predicate
p({ 1 => "a", 2 => "b", 3 => "c" }.select { |k, _v| k.odd? })
sik1 = { 1 => "a", 2 => "b", 3 => "c" }; sic1 = sik1.select { |k, _v| k.odd? }; p sic1

# single-param block binds the KEY (not the [k,v] pair)
p({ 1 => 10, 2 => 20, 3 => 30 }.select { |k| k > 1 })
skf1 = { 1 => 10, 2 => 20, 3 => 30 }; skc1 = skf1.select { |k| k > 1 }; p skc1

# single-entry hash
p({ only: 1 }.select { |_k, v| v > 0 })
sse1 = { only: 1 }; sse2 = sse1.select { |_k, v| v > 0 }; p sse2

# none match
p({ a: 1, b: 2 }.select { |_k, v| v > 100 })
snm1 = { a: 1, b: 2 }; snm2 = snm1.select { |_k, v| v > 100 }; p snm2

emptyh_s = {}; p(emptyh_s.select { |_k, v| v > 0 })
p({ a: 1, b: 2 }.select.class)

# A value returned from a method with a `raise` branch loses much of its method
# table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_hs(ohs)
  case ohs
  when Integer then {"a" => 1}
  when String  then {"b" => 2}
  else raise ArgumentError, "no"
  end
end
rb_hs = (raisebr_hs("ab").select { |_k, v| v > 0 } rescue $!.class); p rb_hs

# Filtering a Proc-valued Hash with a block that calls the value emits ill-typed C.
# Kept commented: a compile abort takes down the whole file.
pv745 = { "x" => ->(v745) { v745 > 1 } }
p(pv745.select { |_k745, c745| c745.call(3) }.keys)
r745 = pv745.select { |_k746, c746| c746.call(3) }; p r745.keys

# On a Hash returned by a seedless Array#reduce.
a82sl = { n: 1, s: { x: 2 } }
h82sl = [a82sl].reduce { |acc82sl, l82sl| acc82sl }
r82sl = (h82sl.select { |k82sl, v82sl| k82sl == :n } rescue $!.class); p r82sl
