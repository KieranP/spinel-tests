# frozen_string_literal: true
# Interrupt#== (Exception#==)
# equal: same class and same message
p(Interrupt.new("bad") == Interrupt.new("bad"))
a001 = Interrupt.new("bad"); b001 = Interrupt.new("bad"); p(a001 == b001)
c001 = (Interrupt.new("bad") == Interrupt.new("bad")); p c001

# different message -> not equal
p(Interrupt.new("a") == Interrupt.new("b"))
a002 = Interrupt.new("a"); b002 = Interrupt.new("b"); p(a002 == b002)

# default (no message) instances are equal to each other
p(Interrupt.new == Interrupt.new)
c003 = (Interrupt.new == Interrupt.new); p c003

# reflexive
a004 = Interrupt.new("m"); p(a004 == a004)
c004 = (a004 == a004); p c004

# not equal to a non-exception
p(Interrupt.new("m") == "m")
c005 = (Interrupt.new("m") == "m"); p c005
