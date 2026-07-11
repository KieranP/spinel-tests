# frozen_string_literal: true
# Range#sum
p((1..5).sum)
a051 = (1..5); p(a051.sum)
a052 = (1..5); c052 = (a052.sum); p c052
p((1..5).sum(100))
a053 = (1..5); p(a053.sum(100))
a054 = (1..5); c054 = (a054.sum(1.5)); p c054
# Float range #sum falls back to #each -> TypeError (can't iterate from Float)
r_f = ((1.0..5.0).sum rescue $!.class); p r_f
p((1...5).sum)
p((5..1).sum)
p((3..3).sum)
p((-3..3).sum)
p((1..5).sum { |n| n * n })
v055 = (1..5).sum { |n| n * n }; p(v055)

aug055 = [[2.0, 3.0, 0.0]]; x055 = Array.new(1, 0.0)
s055 = (1...1).sum { |j055| aug055[0][j055] * x055[j055] }
x055[0] = (aug055[0][1] - s055) / aug055[0][0]; p x055

rcr = [(1..5)][0]; p rcr.sum
