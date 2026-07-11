# frozen_string_literal: true
# Float#abs2
# Direct p() form aborts compilation ("unsupported p argument: CallNode `abs2`"):
p(3.5.abs2)
# Assignment form compiles but raises NoMethodError at runtime:
r001 = (3.5.abs2 rescue $!.class); p r001
a001 = -3.5; r002 = (a001.abs2 rescue $!.class); p r002
r003 = (0.0.abs2 rescue $!.class); p r003
r004 = (Float::INFINITY.abs2 rescue $!.class); p r004
