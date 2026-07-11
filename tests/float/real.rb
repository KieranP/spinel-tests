# frozen_string_literal: true
# Float#real (a real number is its own real part)
# Direct p() form aborts compilation ("unsupported p argument: CallNode `real`"):
p(3.5.real)
# Assignment form compiles but raises NoMethodError at runtime:
r001 = (3.5.real rescue $!.class); p r001
a001 = -2.5; r002 = (a001.real rescue $!.class); p r002
r003 = (0.0.real rescue $!.class); p r003
