# frozen_string_literal: true
# Array#unshift

p([1, 2].unshift(0))

a001 = [1, 2]
p a001.class
a001.unshift(0)
p a001

a002 = [1, 2]
b002 = 0
p b002.class
a002.unshift(b002)
p a002

a003 = [1, 2]
b003 = 0
c003 = a003.unshift(b003)
p c003.class
p c003

p([1.1, 2.2].unshift(0.0))

a004 = [1.1, 2.2]
p a004.class
a004.unshift(0.0)
p a004

a005 = [1.1, 2.2]
b005 = 0.0
p b005.class
a005.unshift(b005)
p a005

a006 = [1.1, 2.2]
b006 = 0.0
c006 = a006.unshift(b006)
p c006.class
p c006

p(["b", "c"].unshift("a"))

a007 = ["b", "c"]
p a007.class
a007.unshift("a")
p a007

a008 = ["b", "c"]
b008 = "a"
p b008.class
a008.unshift(b008)
p a008

a009 = ["b", "c"]
b009 = "a"
c009 = a009.unshift(b009)
p c009.class
p c009

p([1, 2].unshift(-1, 0))

a010 = [1, 2]
a010.unshift(-1, 0)
p a010

p([1, 2].unshift(nil))

a011 = [1, 2]
a011.unshift(nil)
p a011

p([1.1, 2.2].unshift(nil))

r012 = ([].unshift(1) rescue "err")
p r012
# zero arguments is a no-op returning the receiver
a023 = [1, 2]; p a023.unshift; p a023
p([1, 2].unshift)

# capturing the return of an unshift that widens the element type gives the
# capture the pre-widening type
# Kept commented: only a compile *warning*, but the local then prints raw memory.
ua96 = [1, 2]; uc96 = ua96.unshift(:x); p uc96
# control: no capture, and an already-polymorphic receiver
ua97 = [1, 2]; ua97.unshift(:x); p ua97
ub97 = [1, :y]; uc97 = ub97.unshift(:x); p uc97

# #unshift inside a lambda whose argument is an empty Array
ug01 = ->(acc01) { acc01.unshift(1) }
ue01 = []
# BUG 20260904111525287 - #unshift inside a lambda raises NoMethodError for an empty Array argument
# p ug01.call(ue01)
# BUG 20260904111525287 - #unshift inside a lambda raises NoMethodError for an empty Array argument
# ur01 = (ug01.call(ue01) rescue $!.class); p ur01
