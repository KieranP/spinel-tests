# frozen_string_literal: true
# Hash#sum
p({ a: 1, b: 2 }.sum { |_k, v| v })
a065 = { a: 1, b: 2 }; p(a065.sum { |_k, v| v })
a066 = { a: 1, b: 2 }; c066 = (a066.sum { |_k, v| v }); p c066
p({ a: 1, b: 2 }.sum(100) { |_k, v| v })
za901 = { a: 1, b: 2 }; zb901 = (za901.sum(100) { |_k, v| v }); p zb901
p({ a: 1.5, b: 2.5 }.sum { |_k, v| v })
za902 = { a: 1.5, b: 2.5 }; zb902 = (za902.sum { |_k, v| v }); p zb902
p({}.sum { |_k, v| v })
za903 = {}; zb903 = (za903.sum { |_k, v| v }); p zb903
p({}.sum(100) { |_k, v| v })
za904 = {}; zb904 = (za904.sum(100) { |_k, v| v }); p zb904
# blockless sum on a literal receiver (Ruby: empty -> 0/init)
p({}.sum)
p({}.sum(0))
# blockless sum on a variable receiver
za905 = {}; zb905 = (za905.sum); p zb905

# A value returned from a method with a `raise` branch loses much of its method
# table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_hu(ohu)
  case ohu
  when Integer then {"a" => 1}
  when String  then {"b" => 2}
  else raise ArgumentError, "no"
  end
end
rb_hu = (raisebr_hu("ab").sum { |_k, v| v } rescue $!.class); p rb_hu

# A non-numeric init raises instead of concatenating the [key, value] pairs.
r113 = ({ a: 1, b: 2 }.sum([]) rescue $!.class); p r113
h114 = { a: 1 }; r114 = (h114.sum([]) rescue $!.class); p r114
# Control: a String init with a block that returns Strings matches.
p({ a: 1 }.sum("") { |k115, _v115| k115.to_s })
r115 = { a: 1 }.sum("") { |k, _v| k.to_s }; p r115
# Control: a numeric init, with and without a block, matches.
p({ a: 1, b: 2 }.sum(10) { |_k116, v116| v116 })
r116 = { a: 1, b: 2 }.sum(10) { |_k, v| v }; p r116
# summing container values with an Array init and a block
p({ a: [1], b: [2] }.sum([]) { |_k117, v117| v117 })
r117 = { a: [1], b: [2] }.sum([]) { |_k, v| v }; p r117
