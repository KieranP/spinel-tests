# frozen_string_literal: true
# Kernel#itself
a008 = Object.new; p(a008.itself.equal?(a008))
a009 = Object.new; v009 = a009.itself; p(v009.equal?(a009))
p(5.itself)
p("ab".itself)
p([1, 2].itself)
p({ a: 1 }.itself)
p(nil.itself)
p(:s.itself)
p(1.5.itself)
v010 = [1, 2].itself; p v010
v011 = "ab".itself; p v011
