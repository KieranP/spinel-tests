# frozen_string_literal: true
# Array#transpose

p([[1, 2], [3, 4]].transpose)

a001 = [[1, 2], [3, 4]]
p a001.class
p a001.transpose

a002 = [[1, 2], [3, 4]]
b002 = a002.transpose
p b002.class
p b002

p([[1.1, 2.2], [3.3, 4.4]].transpose)

a003 = [[1.1, 2.2], [3.3, 4.4]]
p a003.class
p a003.transpose

a004 = [[1.1, 2.2], [3.3, 4.4]]
b004 = a004.transpose
p b004.class
p b004

p([["a", "b"], ["c", "d"]].transpose)

a005 = [["a", "b"], ["c", "d"]]
p a005.class
p a005.transpose

a006 = [["a", "b"], ["c", "d"]]
b006 = a006.transpose
p b006.class
p b006

p([[1, 2, 3], [4, 5, 6]].map(&:reverse).transpose)
a413 = [[1, 2, 3], [4, 5, 6]]; c413 = a413.map(&:reverse).transpose; p c413

# empty receiver -> []
p([].transpose)
a020 = []
c020 = a020.transpose
p c020

# heterogeneous columns
p([[1, "a"], [2, "b"], [3, "c"]].transpose)
a021 = [[1, "a"], [2, "b"]]
c021 = a021.transpose
p c021

# single row
p([[1, 2, 3]].transpose)
a022 = [[1, 2, 3]]
c022 = a022.transpose
p c022

# ragged rows raise IndexError
r023 = ([[1, 2], [3]].transpose rescue $!.class)
p r023

# reduce/inject on a transpose result row raises NoMethodError under Spinel (sum works)
c274 = [[1, 2], [3, 4]].transpose
r274 = (c274[0].reduce(0) { |a274, x274| a274 + x274 } rescue $!.class); p r274
r274b = (c274[0].inject(:+) rescue $!.class); p r274b

# rectangular, single-row and empty matrices; a ragged one raises IndexError
h171 = [[1, 2, 3], [4, 5, 6]]
p h171.transpose
w171 = h171.transpose; p w171
p([[1]].transpose)
p([].transpose)
p([[1, 2], [3, 4], [5, 6]].transpose)
w172 = [[1, 2], [3, 4], [5, 6]].transpose; p w172
p([%w[a b], %w[c d]].transpose)
w173 = ([[1, 2], [3]].transpose rescue $!.class); p w173
h174 = [[1, 2, 3], [4, 5, 6]]
p h174.transpose.map { |c174| c174.sum }
