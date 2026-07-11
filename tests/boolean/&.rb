# frozen_string_literal: true
# TrueClass#&

p(true & false)

a001 = true
p a001.class
p(a001 & false)

a002 = true
b002 = false
p b002.class
p(a002 & b002)

a003 = true
b003 = false
c003 = (a003 & b003)
p c003.class
p c003

p(true & true)

a004 = true
p a004.class
p(a004 & true)

a005 = true
b005 = true
p b005.class
p(a005 & b005)

a006 = true
b006 = true
c006 = (a006 & b006)
p c006.class
p c006

p(true & nil)

a007 = true
p a007.class
p(a007 & nil)

a008 = true
b008 = nil
p b008.class
p(a008 & b008)

a009 = true
b009 = nil
c009 = (a009 & b009)
p c009.class
p c009

# FalseClass#&

p(false & true)

a010 = false
p a010.class
p(a010 & true)

a011 = false
b011 = true
p b011.class
p(a011 & b011)

a012 = false
b012 = true
c012 = (a012 & b012)
p c012.class
p c012

p(false & false)

a013 = false
p a013.class
p(a013 & false)

a014 = false
b014 = false
p b014.class
p(a014 & b014)

a015 = false
b015 = false
c015 = (a015 & b015)
p c015.class
p c015

p(false & nil)

a016 = false
p a016.class
p(a016 & nil)

a017 = false
b017 = nil
p b017.class
p(a017 & b017)

a018 = false
b018 = nil
c018 = (a018 & b018)
p c018.class
p c018

# A truthy non-boolean argument yields true (only nil/false are falsy)

p(true & "x")
p(true & :y)
p(true & 0.0)
p(false & "x")

a019 = true
s019 = "sy"
p(a019 & s019)

a020 = true
r020 = (a020 & [1])
p r020

# Integer argument: Spinel does a numeric bitwise-AND instead of logical &
p(true & 0)
p(true & 2)

a021 = true
b021 = 0
c021 = (a021 & b021)
p c021

# Folding a boolean Array with & : the explicit-block form works and matches.
p([true, false, true].reduce { |x022, y022| x022 & y022 })
d022 = [true, true, false]
p(d022.inject(true) { |x023, y023| x023 & y023 })
# The Symbol-operator fold (reduce(:&)) is a front-end reject — kept commented (compile abort).
p([true, false, true].reduce(:&))
