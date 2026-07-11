# frozen_string_literal: true
# Array#push

p([1, 2].push(3))

a001 = [1, 2]
p a001.class
a001.push(3)
p a001

a002 = [1, 2]
b002 = 3
p b002.class
a002.push(b002)
p a002

a003 = [1, 2]
b003 = 3
c003 = a003.push(b003)
p c003.class
p c003

p([1.1, 2.2].push(3.3))

a004 = [1.1, 2.2]
p a004.class
a004.push(3.3)
p a004

a005 = [1.1, 2.2]
b005 = 3.3
p b005.class
a005.push(b005)
p a005

a006 = [1.1, 2.2]
b006 = 3.3
c006 = a006.push(b006)
p c006.class
p c006

p(["a", "b"].push("c"))

a007 = ["a", "b"]
p a007.class
a007.push("c")
p a007

a008 = ["a", "b"]
b008 = "c"
p b008.class
a008.push(b008)
p a008

a009 = ["a", "b"]
b009 = "c"
c009 = a009.push(b009)
p c009.class
p c009

p([1, 2].push(3, 4, 5))

a010 = [1, 2]
a010.push(3, 4, 5)
p a010

p([1, 2].push(nil))

a011 = [1, 2]
a011.push(nil)
p a011

p([1, 2].push([3, 4]))

a012 = [1, 2]
a012.push([3, 4])
p a012

p([].push(1))
r013 = ([].push(1, 2) rescue "err")
p r013
# zero arguments is a no-op returning the receiver
a020 = [1, 2]; p a020.push; p a020
p([1, 2].push)

# capturing the return of a push that widens the element type gives the capture
# the pre-widening type; the receiver itself is fine
# Kept commented: only a compile *warning*, but the local then prints raw memory.
pa96 = [1, 2]; pc96 = pa96.push(:x); p pc96
pa97 = [1, 2]; pc97 = pa97.push(:x); p pa97; p pc97
# control: no capture, no widening, and an already-polymorphic receiver
pa98 = [1, 2]; pa98.push(:x); p pa98
p([1, 2].push(:x))
pa99 = [1, 2]; pc99 = pa99.push(3); p pc99
pb99 = [1, :y]; pd99 = pb99.push(:x); p pd99

# #push inside a lambda whose argument is an empty Array
pg01 = ->(acc01) { acc01.push(1) }
pe01 = []
p pg01.call(pe01)
# BUG 20260904191646791 - capturing the result of a lambda mutating an empty Array argument aborts the C build
# pw01 = pg01.call(pe01); p pw01
# control: a non-empty argument
pg02 = ->(acc02) { acc02.push(1) }
pe02 = [9]
p pg02.call(pe02)
pw02 = pg02.call(pe02); p pw02
