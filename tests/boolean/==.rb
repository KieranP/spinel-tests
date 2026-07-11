# frozen_string_literal: true
# TrueClass#==

p(true == true)

a001 = true
p a001.class
p(a001 == true)

a002 = true
b002 = true
p b002.class
p(a002 == b002)

a003 = true
b003 = true
c003 = (a003 == b003)
p c003.class
p c003

p(true == false)

a004 = true
p a004.class
p(a004 == false)

a005 = true
b005 = false
p b005.class
p(a005 == b005)

a006 = true
b006 = false
c006 = (a006 == b006)
p c006.class
p c006

p(true == nil)

a007 = true
p a007.class
p(a007 == nil)

a008 = true
b008 = nil
p b008.class
p(a008 == b008)

a009 = true
b009 = nil
c009 = (a009 == b009)
p c009.class
p c009

# FalseClass#==

p(false == false)

a010 = false
p a010.class
p(a010 == false)

a011 = false
b011 = false
p b011.class
p(a011 == b011)

a012 = false
b012 = false
c012 = (a012 == b012)
p c012.class
p c012

p(false == true)

a013 = false
p a013.class
p(a013 == true)

a014 = false
b014 = true
p b014.class
p(a014 == b014)

a015 = false
b015 = true
c015 = (a015 == b015)
p c015.class
p c015

p(false == nil)

a016 = false
p a016.class
p(a016 == nil)

a017 = false
b017 = nil
p b017.class
p(a017 == b017)

a018 = false
b018 = nil
c018 = (a018 == b018)
p c018.class
p c018
