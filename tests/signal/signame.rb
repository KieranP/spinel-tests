# frozen_string_literal: true
# Signal.signame
# Only platform-stable signal numbers are asserted (EXIT=0, HUP=1, INT=2, KILL=9,
# TERM=15); USR1/USR2 numbers vary by OS, so they are not pinned here.
p(Signal.signame(0))
p(Signal.signame(1))
p(Signal.signame(2))
p(Signal.signame(9))
p(Signal.signame(15))
p(Signal.signame(999))
p(Signal.signame(-1))
p(Signal.signame(2.9))
s001 = Signal.signame(2); p(s001)
n002 = 15; s002 = Signal.signame(n002); p(s002)
rt003 = Signal.signame(Signal.list["INT"]); p(rt003)

# An immediate non-Integer argument (nil/true/Symbol) must raise TypeError.
r004 = (Signal.signame(nil) rescue $!.class); p r004
r005 = (Signal.signame(true) rescue $!.class); p r005
r006 = (Signal.signame(:INT) rescue $!.class); p r006

# A pointer-typed non-Integer argument (String/Array) must raise TypeError.
r007 = (Signal.signame("INT") rescue $!.class); p r007
