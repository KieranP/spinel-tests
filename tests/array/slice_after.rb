# frozen_string_literal: true
# Array#slice_after

p([1, 2, 4, 9, 10, 11, 12, 0].slice_after { |x| x.even? }.to_a)

a001 = [1, 2, 4, 9, 10, 11, 12, 0]
p a001.class
p a001.slice_after { |x| x.even? }.to_a

a002 = [1, 2, 4, 9, 10, 11, 12, 0]
c002 = a002.slice_after { |x| x.even? }.to_a
p c002.class
p c002

# split after each multiple of 3
p([1, 2, 3, 4, 5, 6, 7].slice_after { |x2| (x2 % 3).zero? }.to_a)

a003 = [1, 2, 3, 4, 5, 6, 7]
c003 = a003.slice_after { |x2| (x2 % 3).zero? }.to_a
p c003

# pattern argument (uses ===)
p([0, 1, 2, 0, 3, 4].slice_after(0).to_a)

a004 = [0, 1, 2, 0, 3, 4]
c004 = a004.slice_after(0).to_a
p c004

# Regexp pattern on strings (Range/Class/Regexp/value patterns are now supported)
p(["a", "b", "A", "c", "B"].slice_after(/[A-Z]/).to_a)

a005 = ["a", "b", "A", "c", "B"]
c005 = a005.slice_after(/[A-Z]/).to_a
p c005

# WONTFIX: See docs/limitations.md - "By design — slice_before / slice_after with a Proc pattern"
# p([1, 2, 3].slice_after(->(x7) { x7 == 2 }).to_a)

# block always true -> each element its own slice
p([1, 2, 3].slice_after { |x3| true }.to_a)

a006 = [1, 2, 3]
c006 = a006.slice_after { |x3| true }.to_a
p c006

# string elements
p(["a", "B", "c", "d", "E"].slice_after { |x5| x5 == x5.upcase }.to_a)

a007 = ["a", "B", "c", "d", "E"]
c007 = a007.slice_after { |x5| x5 == x5.upcase }.to_a
p c007

# float elements
p([1.0, 2.0, 4.0, 5.0].slice_after { |x6| x6 > 3.0 }.to_a)

a008 = [1.0, 2.0, 4.0, 5.0]
c008 = a008.slice_after { |x6| x6 > 3.0 }.to_a
p c008

# empty receiver
p([].slice_after { |x4| x4.even? }.to_a)
c009 = [].slice_after { |x4| x4.even? }.to_a
p c009
