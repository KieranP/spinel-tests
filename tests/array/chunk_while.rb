# frozen_string_literal: true
# Array#chunk_while

p([1, 2, 4, 5].chunk_while { |x, y| y == x + 1 }.to_a)

a001 = [1, 2, 4, 5]
p a001.class
p a001.chunk_while { |x, y| y == x + 1 }.to_a

a002 = [1, 2, 4, 5]
c002 = a002.chunk_while { |x, y| y == x + 1 }.to_a
p c002.class
p c002

p([1, 2, 3, 10, 11, 20].chunk_while { |x2, y2| y2 == x2 + 1 }.to_a)

a003 = [1, 2, 3, 10, 11, 20]
p a003.class
p a003.chunk_while { |x2, y2| y2 == x2 + 1 }.to_a

a004 = [1, 2, 3, 10, 11, 20]
c004 = a004.chunk_while { |x2, y2| y2 == x2 + 1 }.to_a
p c004.class
p c004

p([5, 4, 3, 1, 6].chunk_while { |x3, y3| y3 < x3 }.to_a)

a005 = [5, 4, 3, 1, 6]
p a005.class
p a005.chunk_while { |x3, y3| y3 < x3 }.to_a

a006 = [5, 4, 3, 1, 6]
c006 = a006.chunk_while { |x3, y3| y3 < x3 }.to_a
p c006.class
p c006

# float elements
p([1.1, 1.1, 2.2, 3.3].chunk_while { |x4, y4| x4 == y4 }.to_a)

a007 = [1.1, 1.1, 2.2, 3.3]
c007 = a007.chunk_while { |x4, y4| x4 == y4 }.to_a
p c007
