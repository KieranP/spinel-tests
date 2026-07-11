# frozen_string_literal: true
# Array#to_h

p([[1, 2], [3, 4]].to_h)

a001 = [[1, 2], [3, 4]]
p a001.class
p a001.to_h

a002 = [[1, 2], [3, 4]]
c002 = a002.to_h
p c002.class
p c002

p([["a", "b"], ["c", "d"]].to_h)

a003 = [["a", "b"], ["c", "d"]]
p a003.class
p a003.to_h

a004 = [["a", "b"], ["c", "d"]]
c004 = a004.to_h
p c004.class
p c004

p([[:a, 1], [:b, 2]].to_h)

a005 = [[:a, 1], [:b, 2]]
p a005.class
p a005.to_h

a006 = [[:a, 1], [:b, 2]]
c006 = a006.to_h
p c006.class
p c006

# the block form, and pair arrays reached through a local
h371 = [[1, 2], [3, 4]]
p h371.to_h
w371 = h371.to_h; p w371
p h371.to_h { |k372, v372| [v372, k372] }
w372 = h371.to_h { |k373, v373| [v373, k373] }; p w372
p([1, 2].to_h { |x374| [x374, x374 * x374] })
w374 = [1, 2].to_h { |x375| [x375, x375 * x375] }; p w374
p([].to_h)
p([%w[a x], %w[b y]].to_h)
w376 = [%w[a x], %w[b y]].to_h; p w376
w377 = ([[1, 2, 3]].to_h rescue $!.class); p w377
w378 = ([[1]].to_h rescue $!.class); p w378
w379 = ([[1, 2], [3]].to_h rescue $!.class); p w379
