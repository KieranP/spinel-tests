# frozen_string_literal: true
# Hash#each
p({ a: 1, b: 2 }.each { |_k, _v| nil })
a801 = { a: 1, b: 2 }; c801 = (a801.each { |_k, _v| nil }); p c801
a802 = { a: 1, b: 2 }; out802 = []; a802.each { |k, v| out802 << [k, v] }; p out802

out803 = []; { a: 1, b: 2 }.each { |pair| out803 << pair }; p out803
a804 = { a: 1, b: 2 }; out804 = []; a804.each { |pair| out804 << pair }; p out804
p({ "a" => 1, "b" => 2 }.each { |_k, _v| nil })
b801 = { "a" => 1, "b" => 2 }; c901 = (b801.each { |_k, _v| nil }); p c901
b802 = { 1 => "x", 2 => "y" }; out902 = []; b802.each { |k, v| out902 << [k, v] }; p out902
b803 = { x: 10, y: 20, z: 30 }; sum803 = 0; b803.each { |_k, v| sum803 += v }; p sum803
b804 = { a: 1 }; out904 = []; b804.each { |k, _v| out904 << k }; p out904
emptyh_e = {}; p(emptyh_e.each { |_k, _v| nil })

# As a method's implicit return value this yields a zero value of the receiver's
# type instead of the receiver itself.
def ir801(x801); x801.each { |k801, v801| nil }; end
p ir801({ "a" => 1 })
v801 = ir801({ "a" => 1 }); p v801
# control: the same call with the result consumed explicitly
def ic801(y801); return y801.each { |k801, v801| nil }; end
p ic801({ "a" => 1 })

# the same iterator in the tail position of a BLOCK aborts the C build
# Kept commented: the compile abort takes down the whole file.
def by801; yield({ "a" => 1 }); end
p(by801 { |h811| h811.each { |k811, v811| nil } })
w811 = by801 { |h812| h812.each { |k812, v812| nil } }; p w811
# control: the same call with the result consumed inside the block
def bc801; yield({ "a" => 1 }); end
p(bc801 { |h813| r813 = h813.each { |k813, v813| nil }; r813 })
u813 = bc801 { |h814| r814 = h814.each { |k814, v814| nil }; r814 }; p u813

# Mutating the key set from inside the block: adding a key does not raise, and
# deleting the current key stops the walk after the first entry.
h973 = { a: 1, b: 2 }
r973 = (h973.each { |_k973, _v973| h973[:c] = 3 } rescue $!.class); p r973
h974 = { a: 1, b: 2 }
h974.each { |k974, _v974| h974.delete(k974) }; p h974
# Control: mutating only the values during iteration matches.
h975 = { a: [1], b: [2] }; h975.each { |_k975, v975| v975 << 9 }; p h975
h976 = { a: [1] }; r976 = (h976.each { |_k, v| v << 9 }); p r976

# a container value bound to a block parameter, then indexed
h977 = {}; h977["a"] = [7, 8, 9]
h977.each { |_k977, v977| w977 = v977; p w977[0] }
o978 = []; { a: { b: 1 } }.each { |_k978, v978| o978 << v978[:b] }; p o978

t970 = Thread.new { { "a" => 1 }.each { |k970, v970| p k970 } }; p t970.value.class
v971 = Thread.new { { "a" => 1 }.each { |k971, v971x| p k971 } }.value; p v971.class
t972 = Thread.new { { "a" => 1 }.each { |k972, v972| p k972 }; :done }; p t972.value
v973 = Thread.new { { "a" => 1 }.each { |k973, v973x| p k973 }; :done }.value; p v973
