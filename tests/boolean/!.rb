# frozen_string_literal: true
# TrueClass#!

p(!true)

a001 = true
p a001.class
p(!a001)

a002 = true
b002 = (!a002)
p b002.class
p b002

# FalseClass#!

p(!false)

a003 = false
p a003.class
p(!a003)

a004 = false
b004 = (!a004)
p b004.class
p b004

# Explicit-dispatch and double-negation forms
p(true.!)
p(false.!)
p(true.send(:!))
p(!!true)
p(!!false)
a005 = true; p(a005.!)
a006 = false; v006 = a006.send(:!); p v006
