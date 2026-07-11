# frozen_string_literal: true
# Array#pop

p([1, 2, 3].pop)

a001 = [1, 2, 3]
p a001.class
p a001.pop

a002 = [1, 2, 3]
c002 = a002.pop
p c002.class
p c002

p([1.1, 2.2, 3.3].pop)

a003 = [1.1, 2.2, 3.3]
p a003.class
p a003.pop

a004 = [1.1, 2.2, 3.3]
c004 = a004.pop
p c004.class
p c004

p(["a", "b", "c"].pop)

a005 = ["a", "b", "c"]
p a005.class
p a005.pop

a006 = ["a", "b", "c"]
c006 = a006.pop
p c006.class
p c006

p([1, 2, 3, 4].pop(2))

a007 = [1, 2, 3, 4]
b007 = 2
p b007.class
p a007.pop(2)

a008 = [1, 2, 3, 4]
b008 = 2
c008 = a008.pop(b008)
p c008.class
p c008

p([].pop)

c009 = [].pop
p c009

p([1, 2, 3].pop(0))

a010 = [1, 2, 3]
c010 = a010.pop(0)
p c010

p([1, 2].pop(5))

a011 = [1, 2]
b011 = 5
c011 = a011.pop(b011)
p c011

p([1, 2, 3].pop(1))

a012 = [1, 2, 3]
c012 = a012.pop(1)
p c012

# the counted form, past the length, and on an empty receiver
h241 = [1, 2, 3, 4, 5]; p h241.pop(2); p h241
h242 = [1, 2, 3, 4, 5]; w242 = h242.pop(2); p w242; p h242
h243 = [1, 2, 3]; p h243.pop(0); p h243
h244 = [1, 2, 3]; p h244.pop(99); p h244
h245 = []; p h245.pop
h246 = []; p h246.pop(2)
h247 = %w[a b c]; p h247.pop(2); p h247
n248 = 2
h248 = [1, 2, 3]; p h248.pop(n248); p h248
h249 = [[1], [2]]; p h249.pop(1); p h249

# empty receiver: a drained Float array
f250 = [1.5, 2.5]; f250.pop; f250.pop; p f250.pop
f251 = [3.5]; f251.pop; g251 = f251.pop; p g251
