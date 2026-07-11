# frozen_string_literal: true
# Array#prepend

# Array#prepend is an alias of #unshift.

p([1, 2].prepend(0))

a001 = [1, 2]
p a001.class
a001.prepend(0)
p a001

a002 = [1, 2]
c002 = a002.prepend(0)
p c002.class
p c002

p([1.1, 2.2].prepend(0.0))

a003 = [1.1, 2.2]
a003.prepend(0.0)
p a003

p(["b", "c"].prepend("a"))

a004 = ["b", "c"]
a004.prepend("a")
p a004

p([1, 2].prepend(-1, 0))

a005 = [1, 2]
a005.prepend(-1, 0)
p a005
# zero arguments is a no-op returning the receiver
a024 = [1, 2]; p a024.prepend; p a024
p([1, 2].prepend)
