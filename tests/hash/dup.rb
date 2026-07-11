# frozen_string_literal: true
# Hash#dup
p({ a: 1 }.dup.class)
a037 = { a: 1 }; b037 = a037.dup; p(b037.class)
a038 = { a: 1 }; v038 = a038.dup; p(v038 == a038)

# independence: mutating the dup leaves the original unchanged
za950 = { a: 1, b: 2 }; zd950 = za950.dup; zd950[:z] = 9; p zd950; p za950
# dup of an empty hash
p({}.dup)
za951 = {}; zc951 = za951.dup; p zc951
# dup == original
p({ a: 1, b: 2 }.dup == { a: 1, b: 2 })
za952 = { a: 1, b: 2 }; zc952 = (za952.dup == za952); p zc952
# mutate the original after dup, the dup is unchanged
za953 = { a: 1 }; zd953 = za953.dup; za953[:b] = 2; p zd953; p za953
