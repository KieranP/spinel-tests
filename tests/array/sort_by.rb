# frozen_string_literal: true
# Array#sort_by
p([3, 1, 2].sort_by { |n| -n })

a001 = [3, 1, 2]
p a001.class
p a001.sort_by { |n| -n }

a002 = [3, 1, 2]
c002 = a002.sort_by { |n| -n }
p c002.class
p c002

p([3.3, 1.1, 2.2].sort_by { |n| -n })

a003 = [3.3, 1.1, 2.2]
p a003.class
p a003.sort_by { |n| -n }

a004 = [3.3, 1.1, 2.2]
c004 = a004.sort_by { |n| -n }
p c004.class
p c004

p(["ccc", "a", "bb"].sort_by { |s| s.length })

a005 = ["ccc", "a", "bb"]
p a005.class
p a005.sort_by { |s| s.length }

a006 = ["ccc", "a", "bb"]
c006 = a006.sort_by { |s| s.length }
p c006.class
p c006

# empty
p([].sort_by { |n| -n })
a007 = []
c007 = a007.sort_by { |n| -n }
p c007.class
p c007

# single element
p([5].sort_by { |n| -n })
a008 = [5]
c008 = a008.sort_by { |n| -n }
p c008

# block returning a tuple/array key (length then value)
p(["ccc", "a", "bb", "dd"].sort_by { |s| [s.length, s] })
a009 = ["ccc", "a", "bb", "dd"]
c009 = a009.sort_by { |s| [s.length, s] }
p c009

# negative keys
p([-3, -1, -2].sort_by { |n| n })
a010 = [-3, -1, -2]
c010 = a010.sort_by { |n| n }
p c010

# Symbol-to-proc, a computed key, and Array / Hash elements through a local
h421 = %w[apple fig banana]
p h421.sort_by(&:length)
w421 = h421.sort_by(&:length); p w421
p h421.sort_by { |s422| -s422.length }
w422 = h421.sort_by { |s423| -s423.length }; p w422
h424 = [[1, 9], [2, 3], [3, 5]]
p h424.sort_by { |r424| r424.last }
w424 = h424.sort_by { |r425| r425.last }; p w424
h426 = [{ n: 3 }, { n: 1 }]
p h426.sort_by { |r426| r426[:n] }
w426 = h426.sort_by { |r427| r427[:n] }; p w426
p([].sort_by { |x428| x428 })
p([7].sort_by { |x429| x429 })

# Blockless #sort_by is an Enumerator. Chaining straight into with_index works; storing
# the enumerator, or passing with_index an offset, does not.
p([3, 1, 2].sort_by.with_index { |x430, i430| -i430 })
w430 = [3, 1, 2].sort_by.with_index { |x431, i431| -i431 }; p w430
a432 = [3, 1, 2]; e432 = a432.sort_by; p e432.class
p([3, 1, 2].sort_by.with_index(1) { |x433, i433| i433 })
w434 = [3, 1, 2].sort_by.with_index(1) { |x434, i434| i434 }; p w434

p([3, 1, 2].sort_by { |x435| Rational(x435, 2) })
w435 = [3, 1, 2].sort_by { |x436| Rational(x436, 2) }; p w435

# a negated Rational sort key
p([Rational(1, 10), Rational(3, 10), Rational(2, 10)].sort_by { |r623| -r623 })
w623 = [Rational(1, 10), Rational(3, 10), Rational(2, 10)].sort_by { |r624| -r624 }; p w623
