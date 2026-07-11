# frozen_string_literal: true
# Hash#take
p({ a: 1, b: 2, c: 3 }.take(2))
t1 = { a: 1, b: 2, c: 3 }; t2 = (t1.take(2)); p t2
p({ a: 1, b: 2, c: 3 }.take(0))
za901 = { a: 1, b: 2, c: 3 }; zb901 = (za901.take(0)); p zb901
p({ a: 1, b: 2, c: 3 }.take(5))
za902 = { a: 1, b: 2, c: 3 }; zb902 = (za902.take(5)); p zb902
p({}.take(2))
za903 = {}; zb903 = (za903.take(2)); p zb903

# On a Hash returned by a seedless Array#reduce.
a82tk = { n: 1, s: { x: 2 } }
h82tk = [a82tk].reduce { |acc82tk, l82tk| acc82tk }
r82tk = (h82tk.take(1) rescue $!.class); p r82tk
