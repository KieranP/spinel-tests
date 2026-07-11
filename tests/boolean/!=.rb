# frozen_string_literal: true
# TrueClass#!=

p(true != false)

a001 = true
p a001.class
p(a001 != false)

a002 = true
b002 = false
p b002.class
p(a002 != b002)

a003 = true
b003 = true
c003 = (a003 != b003)
p c003.class
p c003

p(true != true)

a004 = true
p a004.class
p(a004 != nil)

# FalseClass#!=

p(false != true)

a005 = false
p a005.class
p(a005 != true)

a006 = false
b006 = false
c006 = (a006 != b006)
p c006.class
p c006

p(false != false)

a007 = false
p a007.class
p(a007 != nil)
