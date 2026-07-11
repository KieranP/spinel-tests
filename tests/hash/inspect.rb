# frozen_string_literal: true
# Hash#inspect
p({ a: 1 }.inspect)
a033 = { a: 1 }; p(a033.inspect)
a034 = { a: 1 }; v034 = a034.inspect; p v034

# multi-entry symbol keys
p({ a: 1, b: 2 }.inspect)
a035 = { a: 1, b: 2 }; v035 = a035.inspect; p v035

# string keys
p({ "x" => 1, "y" => 2 }.inspect)
a036 = { "x" => 1, "y" => 2 }; v036 = a036.inspect; p v036

# integer keys, string values
p({ 1 => "one", 2 => "two" }.inspect)
a037 = { 1 => "one", 2 => "two" }; v037 = a037.inspect; p v037

# float values
p({ a: 1.1, b: 2.2 }.inspect)
a038 = { a: 1.1, b: 2.2 }; v038 = a038.inspect; p v038

# nil values
p({ a: nil, b: nil }.inspect)
a039 = { a: nil, b: nil }; v039 = a039.inspect; p v039

# nested-array values
p({ a: [1, 2], b: [3] }.inspect)
a040 = { a: [1, 2], b: [3] }; v040 = a040.inspect; p v040

# nested-hash values
p({ a: { x: 1 }, b: { y: 2 } }.inspect)
a041 = { a: { x: 1 }, b: { y: 2 } }; v041 = a041.inspect; p v041

# empty hash
p({}.inspect)
a042 = {}; v042 = a042.inspect; p v042

# received as a brace-less argument to a user-defined method
def inspect_arg043(h)
  h.inspect
end
p(inspect_arg043('x' => 1))
v043 = inspect_arg043('x' => 1); p v043

# the identical hash written with explicit braces is correct
def inspect_arg044(h)
  h.inspect
end
p(inspect_arg044({ 'x' => 1 }))
v044 = inspect_arg044({ 'x' => 1 }); p v044
