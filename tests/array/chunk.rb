# frozen_string_literal: true
# Array#chunk

p([1, 1, 2, 3].chunk { |ni| ni.even? }.to_a)

a001 = [1, 1, 2, 3]
p a001.class
p a001.chunk { |ni| ni.even? }.to_a

a002 = [1, 1, 2, 3]
c002 = a002.chunk { |ni| ni.even? }.to_a
p c002.class
p c002

p([5, 5, 6, 7, 7].chunk { |mi| mi.odd? }.to_a)

a003 = [5, 5, 6, 7, 7]
p a003.class
p a003.chunk { |mi| mi.odd? }.to_a

a004 = [5, 5, 6, 7, 7]
c004 = a004.chunk { |mi| mi.odd? }.to_a
p c004.class
p c004

p(["a", "a", "b", "b"].chunk { |ns| ns }.to_a)

a005 = ["a", "a", "b", "b"]
p a005.class
p a005.chunk { |ns| ns }.to_a

a006 = ["a", "a", "b", "b"]
c006 = a006.chunk { |ns| ns }.to_a
p c006.class
p c006

# float elements
p([1.1, 1.1, 2.2].chunk { |nf| nf }.to_a)

a007 = [1.1, 1.1, 2.2]
c007 = a007.chunk { |nf| nf }.to_a
p c007
