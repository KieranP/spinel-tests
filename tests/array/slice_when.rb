# frozen_string_literal: true
# Array#slice_when

p([1, 2, 4, 5].slice_when { |a, b| b - a > 1 }.to_a)

a001 = [1, 2, 4, 5]
p a001.class
p a001.slice_when { |a, b| b - a > 1 }.to_a

a002 = [1, 2, 4, 5]
c002 = a002.slice_when { |a, b| b - a > 1 }.to_a
p c002.class
p c002

# split on descending steps
p([1, 2, 3, 2, 1, 5, 6].slice_when { |x, y| x > y }.to_a)

a003 = [1, 2, 3, 2, 1, 5, 6]
c003 = a003.slice_when { |x, y| x > y }.to_a
p c003

# floats
p([1.0, 1.5, 5.0, 5.1].slice_when { |x2, y2| y2 - x2 > 1.0 }.to_a)

a004 = [1.0, 1.5, 5.0, 5.1]
c004 = a004.slice_when { |x2, y2| y2 - x2 > 1.0 }.to_a
p c004

# strings: split when first char changes
p(["a", "an", "b", "bb", "c"].slice_when { |x3, y3| x3[0] != y3[0] }.to_a)

a005 = ["a", "an", "b", "bb", "c"]
c005 = a005.slice_when { |x3, y3| x3[0] != y3[0] }.to_a
p c005

# block never true -> single slice
p([1, 2, 3].slice_when { |x4, y4| false }.to_a)

a006 = [1, 2, 3]
c006 = a006.slice_when { |x4, y4| false }.to_a
p c006

# single element
p([42].slice_when { |x5, y5| true }.to_a)
c007 = [42].slice_when { |x5, y5| true }.to_a
p c007
