# frozen_string_literal: true
# Array#min_by
p([3, 1, 2].min_by { |n| -n })

a001 = [3, 1, 2]
p a001.class
p a001.min_by { |n| -n }

a002 = [3, 1, 2]
c002 = a002.min_by { |n| -n }
p c002.class
p c002

p([3.3, 1.1, 2.2].min_by { |n| -n })

a003 = [3.3, 1.1, 2.2]
p a003.class
p a003.min_by { |n| -n }

a004 = [3.3, 1.1, 2.2]
c004 = a004.min_by { |n| -n }
p c004.class
p c004

p(["ccc", "a", "bb"].min_by { |n| n.length })

a005 = ["ccc", "a", "bb"]
p a005.class
p a005.min_by { |n| n.length }

a006 = ["ccc", "a", "bb"]
c006 = a006.min_by { |n| n.length }
p c006.class
p c006

# min_by(n) count form returns the n smallest by key (distinct keys)
p([10, 20, 30, 40].min_by(2) { |n| n })
a007 = [10, 20, 30, 40]; c007 = a007.min_by(2) { |n| n }; p c007

# the counted form and the Symbol-to-proc form
h131 = %w[apple fig banana kiwi]
p h131.min_by(&:length)
w131 = h131.min_by(&:length); p w131
p h131.min_by(2, &:length)
w132 = h131.min_by(2) { |s132| s132.length }; p w132
p h131.min_by(0) { |s133| s133.length }
p h131.min_by(100) { |s134| s134.length }
p([].min_by { |x135| x135 })
p([].min_by(2) { |x136| x136 })
p([7].min_by(1) { |x137| x137 })
h138 = [[1, 9], [2, 3]]
p h138.min_by { |r138| r138.last }
w138 = h138.min_by(1) { |r139| r139.last }; p w138
p([1, 2].min_by { |x080| [x080] })
v081 = [1, 2].min_by { |x081| [-x081, x081] }; p v081

p([3, 1, 2].min_by { |x084| Rational(x084, 2) })
v084 = [3, 1, 2].min_by { |x085| Rational(x085, 2) }; p v084
