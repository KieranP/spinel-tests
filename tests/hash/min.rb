# frozen_string_literal: true
# Hash#min
p({ a: 1, b: 2 }.min)
a046 = { a: 1, b: 2 }; p(a046.min)
a047 = { a: 1, b: 2 }; c047 = (a047.min); p c047
p({ a: 3, b: 1, c: 2 }.min { |x, y| x[1] <=> y[1] })
za901 = { a: 3, b: 1, c: 2 }; zb901 = (za901.min { |x, y| x[1] <=> y[1] }); p zb901
p({ a: 1 }.min)
za902 = { a: 1 }; zb902 = (za902.min); p zb902
p({}.min)
za903 = {}; zb903 = (za903.min); p zb903
