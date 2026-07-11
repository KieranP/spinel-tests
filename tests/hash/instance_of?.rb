# frozen_string_literal: true
# Hash#instance_of?
p({ a: 1 }.instance_of?(Hash))
p({ a: 1 }.instance_of?(Array))
a018 = { a: 1 }; p(a018.instance_of?(Hash))
a019 = { a: 1 }; v019 = a019.instance_of?(Array); p v019
