# frozen_string_literal: true
# Hash#frozen?
p({ a: 1 }.frozen?)
a004 = { a: 1 }; p(a004.frozen?)
a005 = { a: 1 }; v005 = a005.frozen?; p v005
