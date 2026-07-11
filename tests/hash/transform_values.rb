# frozen_string_literal: true
# Hash#transform_values
p({ a: 1, b: 2 }.transform_values { |v| v * 10 })
a071 = { a: 1, b: 2 }; p(a071.transform_values { |v| v * 10 })
a072 = { a: 1, b: 2 }; c072 = (a072.transform_values { |v| v * 10 }); p c072
p({ "a" => 1, "b" => 2 }.transform_values { |v| v + 100 })
a073 = { "a" => 1, "b" => 2 }; p(a073.transform_values { |v| v + 100 })
p({ 1 => "x", 2 => "y" }.transform_values { |v| v.upcase })
a074 = { 1 => "x", 2 => "y" }; c074 = (a074.transform_values { |v| v.upcase }); p c074
p({ a: 1, b: 2, c: 3 }.transform_values(&:to_s))
a075 = { a: 1, b: 2, c: 3 }; c075 = (a075.transform_values(&:to_s)); p c075
a076 = { a: 10 }; p(a076.transform_values { |v| v / 2 })
a077 = { a: 1, b: 2 }; c077 = (a077.transform_values { |v| v * v }); p c077
emptyh_v = {}; p(emptyh_v.transform_values { |v| v * 2 })
# nested-Hash values -> reduce each inner Hash to a scalar
zh501 = { g1: { x: 1, y: 2 }, g2: { x: 3, y: 4 } }; zr501 = zh501.transform_values { |inner| inner.values.sum }; p zr501
# nested-Array values -> map to their length
zh502 = { a: [1, 2], b: [3, 4, 5] }; zr502 = zh502.transform_values(&:length); p zr502
# chained after merge (add a key, then double every value)
zh503 = { a: 1, b: 2 }; zr503 = zh503.merge(c: 3).transform_values { |v| v * 2 }; p zr503

p({ "za" => 85 }.transform_values { |v| v / 10.0 })
tv901 = { "za" => 85 }.transform_values { |v| v / 10.0 }; p tv901
p({ "za" => 85 }.transform_values { |v| v.to_s })

# A value returned from a method with a `raise` branch loses much of its method
# table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_ht(oht)
  case oht
  when Integer then {"a" => 1}
  when String  then {"b" => 2}
  else raise ArgumentError, "no"
  end
end
rb_ht = (raisebr_ht("ab").transform_values { |v| v } rescue $!.class); p rb_ht

# On a Hash returned by a seedless Array#reduce.
a82tv = { n: 1, s: { x: 2 } }
h82tv = [a82tv].reduce { |acc82tv, l82tv| acc82tv }
r82tv = (h82tv.transform_values { |v82tv| v82tv }.size rescue $!.class); p r82tv
