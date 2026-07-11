# frozen_string_literal: true
# Range#reduce
p((1..5).reduce(:+))
a040 = (1..5); p(a040.reduce(:+))
a041 = (1..5); c041 = (a041.reduce(:+)); p c041
p((1..5).reduce(:*))
p((1..5).reduce(100, :+))
a042 = (1..5); b042 = 10; c042 = (a042.reduce(b042, :+)); p c042
p((1..5).reduce { |acc, n| acc + n })
a043 = (1..5); c043 = (a043.reduce(0) { |acc, n| acc + n }); p c043
p((1...5).reduce(:+))
p((3..3).reduce(:+))
# Float range iterates via #each -> TypeError (can't iterate from Float)
r044 = ((1.0..5.0).reduce(:+) rescue $!.class); p r044
r045 = ((1.0..5.0).reduce(0.0) { |acc, n| acc + n } rescue $!.class); p r045

# An inline Range whose bound was read out of a NESTED array.
rows871 = [[2026, 5, 1]]
m871 = rows871[0][1]
p (1...m871).reduce(0) { |s871, i871| s871 + i871 }
v871 = (1..m871).reduce(0) { |t871, j871| t871 + j871 }; p v871
# An inline Range whose bound is a destructured block parameter.
[[2026, 7]].each do |(y400, m400)|
  p (1...m400).reduce(0) { |s400, mm400| s400 + mm400 }
  v400 = (1...m400).reduce(0) { |s401, mm401| s401 + mm401 }; p v400
end
# binding the Range to a local first compiles and matches
[[2026, 7]].each do |(y402, m402)|
  r402 = (1...m402)
  p r402.reduce(0) { |s402, mm402| s402 + mm402 }
  v402 = r402.reduce(0) { |s403, mm403| s403 + mm403 }; p v402
end
# a plain (non-destructured) block param is unaffected
[7].each do |m404|
  p (1...m404).reduce(0) { |s404, mm404| s404 + mm404 }
  v404 = (1...m404).reduce(0) { |s405, mm405| s405 + mm405 }; p v404
end
