# frozen_string_literal: true
# Hash#kind_of?
p({ a: 1 }.kind_of?(Hash))
p({ a: 1 }.kind_of?(Object))
p({ a: 1 }.kind_of?(Array))
a016 = { a: 1 }; p(a016.kind_of?(Hash))
a017 = { a: 1 }; v017 = a017.kind_of?(Array); p v017
