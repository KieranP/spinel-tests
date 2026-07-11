# frozen_string_literal: true
# Hash#find
p({ a: 1, b: 2 }.find { |_k, v| v == 2 })
a026 = { a: 1, b: 2 }; p(a026.find { |_k, v| v == 2 })
a027 = { a: 1, b: 2 }; c027 = (a027.find { |_k, v| v == 2 }); p c027
p({ "a" => 1, "b" => 2 }.find { |_k, v| v == 2 })
b026 = { "a" => 1, "b" => 2 }; c126 = (b026.find { |_k, v| v == 2 }); p c126
p({ 1 => "x", 2 => "y" }.find { |k, _v| k == 2 })
b027 = { 1 => "x", 2 => "y" }; c127 = (b027.find { |k, _v| k == 2 }); p c127
p({ a: 1 }.find { |_k, v| v > 5 })
b028 = { a: 1 }; c128 = (b028.find { |_k, v| v > 5 }); p c128
p({ a: 1, b: 2, c: 3 }.find { |_k, v| v.even? })
b029 = { a: 1, b: 2, c: 3 }; c129 = (b029.find { |_k, v| v.even? }); p c129
p({ x: 1.5, y: 2.5 }.find { |_k, v| v > 2.0 })
b030 = { x: 1.5, y: 2.5 }; c130 = (b030.find { |_k, v| v > 2.0 }); p c130
emptyh_d = {}; p(emptyh_d.find { |_k, v| v > 0 })
p({ a: 1, b: 2 }.find.class)

# A value returned from a method with a `raise` branch loses much of its method
# table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_hf(ohf)
  case ohf
  when Integer then {"a" => 1}
  when String  then {"b" => 2}
  else raise ArgumentError, "no"
  end
end
rb_hf = (raisebr_hf("ab").find { |_k, _v| true } rescue $!.class); p rb_hf

# On a Hash returned by a seedless Array#reduce.
a82fd = { n: 1, s: { x: 2 } }
h82fd = [a82fd].reduce { |acc82fd, l82fd| acc82fd }
r82fd = (h82fd.find { |k82fd, v82fd| k82fd == :n } rescue $!.class); p r82fd
