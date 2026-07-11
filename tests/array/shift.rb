# frozen_string_literal: true
# Array#shift
p([1, 2, 3].shift)

a001 = [1, 2, 3]
p a001.class
p a001.shift

a002 = [1, 2, 3]
c002 = a002.shift
p c002.class
p c002

p([1.1, 2.2, 3.3].shift)

a003 = [1.1, 2.2, 3.3]
p a003.class
p a003.shift

a004 = [1.1, 2.2, 3.3]
c004 = a004.shift
p c004.class
p c004

p(["a", "b", "c"].shift)

a005 = ["a", "b", "c"]
p a005.class
p a005.shift

a006 = ["a", "b", "c"]
c006 = a006.shift
p c006.class
p c006

p([1, 2, 3, 4].shift(2))

a007 = [1, 2, 3, 4]
p a007.class
p a007.shift(2)

a008 = [1, 2, 3, 4]
b008 = 2
p b008.class
p a008.shift(b008)

a009 = [1, 2, 3, 4]
b009 = 2
c009 = a009.shift(b009)
p c009.class
p c009

p([].shift)

c010 = [].shift
p c010

p([1, 2, 3].shift(0))

a011 = [1, 2, 3]
c011 = a011.shift(0)
p c011

p([1, 2].shift(5))

a012 = [1, 2]
b012 = 5
c012 = a012.shift(b012)
p c012

p([1, 2, 3].shift(1))

a013 = [1, 2, 3]
c013 = a013.shift(1)
p c013

# the counted form, past the length, and on an empty receiver
h231 = [1, 2, 3, 4, 5]; p h231.shift(2); p h231
h232 = [1, 2, 3, 4, 5]; w232 = h232.shift(2); p w232; p h232
h233 = [1, 2, 3]; p h233.shift(0); p h233
h234 = [1, 2, 3]; p h234.shift(99); p h234
h235 = []; p h235.shift
h236 = []; p h236.shift(2)
h237 = %w[a b c]; p h237.shift(2); p h237
n238 = 2
h238 = [1, 2, 3]; p h238.shift(n238); p h238
h239 = [[1], [2]]; p h239.shift(1); p h239

# empty receiver: a drained Float array
f240 = [1.5, 2.5]; f240.shift; f240.shift; p f240.shift
f241 = [3.5]; f241.shift; g241 = f241.shift; p g241
