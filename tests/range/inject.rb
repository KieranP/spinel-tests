# frozen_string_literal: true
# Range#inject
p((1..5).inject(:*))
a024 = (1..5); p(a024.inject(:*))
a025 = (1..5); c025 = (a025.inject(:*)); p c025
p((1..5).inject(2, :*))
a026 = (1..5); b026 = 2; c026 = (a026.inject(b026, :*)); p c026
p((1..5).inject { |prod, n| prod * n })
a027 = (1..5); c027 = (a027.inject(1) { |prod, n| prod * n }); p c027
p((1...5).inject(:+))
# Float range iterates via #each -> TypeError (can't iterate from Float)
r028 = ((1.0..4.0).inject(:*) rescue $!.class); p r028

# An inline Range whose bound was read out of a NESTED array.
rows872 = [[2026, 5, 1]]
m872 = rows872[0][1]
p (1...m872).inject(:+)
v872 = (1...m872).inject(:+); p v872
# An inline Range whose bound is a destructured block parameter.
[[2026, 7]].each do |(y410, m410)|
  p (1...m410).inject(0) { |s410, mm410| s410 + mm410 }
  v410 = (1...m410).inject(0) { |s411, mm411| s411 + mm411 }; p v410
end
