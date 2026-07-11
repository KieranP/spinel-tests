# frozen_string_literal: true
# Hash#is_a?
p({ a: 1 }.is_a?(Hash))
p({ a: 1 }.is_a?(Object))
p({ a: 1 }.is_a?(Array))
a014 = { a: 1 }; p(a014.is_a?(Hash))
a015 = { a: 1 }; v015 = a015.is_a?(Array); p v015
