# frozen_string_literal: true
# Hash#min_by
p({ a: 1, b: 2 }.min_by { |_k, v| v })
a048 = { a: 1, b: 2 }; p(a048.min_by { |_k, v| v })
a049 = { a: 1, b: 2 }; c049 = (a049.min_by { |_k, v| v }); p c049
p({ a: 3, b: 1, c: 2 }.min_by(2) { |_k, v| v })
a217 = { a: 3, b: 1, c: 2 }; c217 = (a217.min_by(2) { |_k, v| v }); p c217
# String keys, key by key-length; result is a [k, v] pair, index its value
zh501 = { "apple" => 3, "kiwi" => 1, "fig" => 2 }; zr501 = zh501.min_by { |k, _v| k.length }; p zr501.last
# min_by over a selected sub-hash
zh502 = { a: 1, b: 2, c: 3 }; zr502 = zh502.select { |_k, v| v > 1 }.min_by { |_k, v| v }; p zr502

# A value returned from a method with a `raise` branch loses much of its method
# table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_hm(ohm)
  case ohm
  when Integer then {"a" => 1}
  when String  then {"b" => 2}
  else raise ArgumentError, "no"
  end
end
rb_hm = (raisebr_hm("ab").min_by { |_k, v| v } rescue $!.class); p rb_hm
