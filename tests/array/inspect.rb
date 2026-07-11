# frozen_string_literal: true
# Array#inspect
p([1, 2, 3].inspect)
a033 = [1, 2, 3]; p(a033.inspect)
a034 = [1, 2, 3]; v034 = a034.inspect; p v034

# Empty array
p([].inspect)
a035 = []; p(a035.inspect)
a036 = []; v036 = a036.inspect; p v036

# Single element
p([42].inspect)
a037 = [42]; v037 = a037.inspect; p v037

# Float array
p([1.1, 2.2].inspect)
a038 = [1.1, 2.2]; p(a038.inspect)
a039 = [1.1, 2.2]; v039 = a039.inspect; p v039

# String array (quoted + escaped)
p(["a", "b"].inspect)
a040 = ["a", "b"]; p(a040.inspect)
a041 = ["a", "b"]; v041 = a041.inspect; p v041

# Nested arrays
p([1, [2, [3]]].inspect)
a042 = [1, [2, [3]]]; p(a042.inspect)
a043 = [1, [2, [3]]]; v043 = a043.inspect; p v043

# Nested empty array
p([[], [1]].inspect)
a044 = [[], [1]]; v044 = a044.inspect; p v044

# Array containing nil (heterogeneous literal)
p([1, nil, 2].inspect)
v045 = [1, nil, 2].inspect; p v045

# Booleans
p([true, false].inspect)
a046 = [true, false]; v046 = a046.inspect; p v046

# Mixed heterogeneous literal
p([1, "a", nil].inspect)
v047 = [1, "a", nil].inspect; p v047

# Strings needing escaping (quote + newline)
p(["a\"b", "c\nd"].inspect)
a048 = ["a\"b", "c\nd"]; v048 = a048.inspect; p v048

# Symbols
p([:a, :b].inspect)
a049 = [:a, :b]; v049 = a049.inspect; p v049

# Tab and backslash escaping
p(["x\ty", "z\\w"].inspect)
a050 = ["x\ty", "z\\w"]; v050 = a050.inspect; p v050

# Direct p(arr) (calls inspect)
p([1, 2, 3])
p(["a", "b"])
p([1, [2, [3]]])
