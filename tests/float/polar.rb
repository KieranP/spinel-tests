# frozen_string_literal: true
# Float#polar (polar form: [magnitude, angle])
# Direct p() form aborts compilation ("unsupported p argument: CallNode `polar`"):
p(3.5.polar)
# Assignment form compiles but raises NoMethodError at runtime:
r001 = (3.5.polar rescue $!.class); p r001
a001 = -2.5; r002 = (a001.polar rescue $!.class); p r002
r003 = (Float::INFINITY.polar rescue $!.class); p r003
