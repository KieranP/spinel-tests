# frozen_string_literal: true
# Array#max_by
p([3, 1, 2].max_by { |n| -n })

a001 = [3, 1, 2]
p a001.class
p a001.max_by { |n| -n }

a002 = [3, 1, 2]
c002 = a002.max_by { |n| -n }
p c002.class
p c002

p([3.3, 1.1, 2.2].max_by { |n| -n })

a003 = [3.3, 1.1, 2.2]
p a003.class
p a003.max_by { |n| -n }

a004 = [3.3, 1.1, 2.2]
c004 = a004.max_by { |n| -n }
p c004.class
p c004

p(["ccc", "a", "bb"].max_by { |n| n.length })

a005 = ["ccc", "a", "bb"]
p a005.class
p a005.max_by { |n| n.length }

a006 = ["ccc", "a", "bb"]
c006 = a006.max_by { |n| n.length }
p c006.class
p c006

# max_by(n) count form returns the n largest by key (distinct keys)
p([10, 20, 30, 40].max_by(2) { |n| n })
a007 = [10, 20, 30, 40]; c007 = a007.max_by(2) { |n| n }; p c007

# the counted form and the Symbol-to-proc form
h141 = %w[apple fig banana kiwi]
p h141.max_by(&:length)
w141 = h141.max_by(&:length); p w141
p h141.max_by(2, &:length)
w142 = h141.max_by(2) { |s142| s142.length }; p w142
p h141.max_by(0) { |s143| s143.length }
p h141.max_by(100) { |s144| s144.length }
p([].max_by { |x145| x145 })
p([].max_by(2) { |x146| x146 })
p([7].max_by(1) { |x147| x147 })
h148 = [{ n: 1 }, { n: 5 }]
p h148.max_by { |r148| r148[:n] }
w148 = h148.max_by(1) { |r149| r149[:n] }; p w148
p([1, 2].max_by { |x082| [x082] })
v083 = [1, 2].max_by { |x083| [-x083, x083] }; p v083

p([3, 1, 2].max_by { |x086| Rational(x086, 2) })
v086 = [3, 1, 2].max_by { |x087| Rational(x087, 2) }; p v086
