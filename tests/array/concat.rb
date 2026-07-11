# frozen_string_literal: true
# Array#concat
p([1, 2].concat([3, 4]))

a001 = [1, 2]
p a001.class
a001.concat([3, 4])
p a001

a002 = [1, 2]
b002 = [3, 4]
p b002.class
a002.concat(b002)
p a002

a003 = [1, 2]
b003 = [3, 4]
c003 = a003.concat(b003)
p c003.class
p c003

p([1.1, 2.2].concat([3.3, 4.4]))

a004 = [1.1, 2.2]
p a004.class
a004.concat([3.3, 4.4])
p a004

a005 = [1.1, 2.2]
b005 = [3.3, 4.4]
p b005.class
a005.concat(b005)
p a005

a006 = [1.1, 2.2]
b006 = [3.3, 4.4]
c006 = a006.concat(b006)
p c006.class
p c006

p(["a", "b"].concat(["c", "d"]))

a007 = ["a", "b"]
p a007.class
a007.concat(["c", "d"])
p a007

a008 = ["a", "b"]
b008 = ["c", "d"]
p b008.class
a008.concat(b008)
p a008

a009 = ["a", "b"]
b009 = ["c", "d"]
c009 = a009.concat(b009)
p c009.class
p c009
# zero arguments is a no-op returning the receiver
a022 = [1, 2]; p a022.concat; p a022
p([1, 2].concat)

# capturing the return of a concat that widens the element type gives the
# capture the pre-widening type
# Kept commented: only a compile *warning*, but the local then prints raw memory.
ca96 = [1, 2]; cc96 = ca96.concat([:x]); p cc96
# control: no capture, and an already-polymorphic receiver
ca97 = [1, 2]; ca97.concat([:x]); p ca97
cb97 = [1, :y]; cc97 = cb97.concat([:x]); p cc97
