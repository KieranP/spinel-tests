# frozen_string_literal: true
# Array#sort

p([3, 1, 2].sort)

a001 = [3, 1, 2]
p a001.class
p a001.sort

a002 = [3, 1, 2]
c002 = a002.sort
p c002.class
p c002

p([3.3, 1.1, 2.2].sort)

a003 = [3.3, 1.1, 2.2]
p a003.class
p a003.sort

a004 = [3.3, 1.1, 2.2]
c004 = a004.sort
p c004.class
p c004

p(["c", "a", "b"].sort)

a005 = ["c", "a", "b"]
p a005.class
p a005.sort

a006 = ["c", "a", "b"]
c006 = a006.sort
p c006.class
p c006

# block comparator (reverse)
p([3, 1, 2].sort { |a, b| b <=> a })
a007 = [3, 1, 2]
c007 = a007.sort { |x, y| y <=> x }
p c007.class
p c007

# empty
p([].sort)
a008 = []
c008 = a008.sort
p c008

# already sorted
p([1, 2, 3].sort)
a009 = [1, 2, 3]
c009 = a009.sort
p c009

# single element
p([5].sort)
a010 = [5]
c010 = a010.sort
p c010

# string block comparator
p(["c", "a", "b"].sort { |a, b| b <=> a })
a011 = ["c", "a", "b"]
c011 = a011.sort { |x, y| y <=> x }
p c011

# float block comparator
p([3.3, 1.1, 2.2].sort { |a, b| b <=> a })
a012 = [3.3, 1.1, 2.2]
c012 = a012.sort { |x, y| y <=> x }
p c012

r550d = ([[3, 1, 2], [6, 4, 5]].map(&:sort) rescue $!.class); p r550d

# Array#sort over Time elements: comparison of Time read from a container yields nil -> ArgumentError
a122 = [Time.new(2026, 1, 2), Time.new(2026, 1, 1)]
r122 = (a122.sort.map(&:day) rescue $!.class); p r122

# comparison block, and String / Array / mixed-error receivers
h431 = [3, 1, 4, 1, 5]
p h431.sort { |x432, y432| y432 <=> x432 }
w431 = h431.sort { |x433, y433| y433 <=> x433 }; p w431
p(%w[pear fig apple].sort)
w432 = %w[pear fig apple].sort; p w432
p([[2, 1], [1, 9]].sort)
w433 = [[2, 1], [1, 9]].sort; p w433
p([].sort)
p([7].sort)
w434 = ([1, "a"].sort rescue $!.class); p w434
p([1.5, 0.5].sort)

def sort601(items) = items.sort { |a, b| a <=> b }
p sort601([3, 1, 2])
w601 = sort601(%w[pear fig apple]); p w601
