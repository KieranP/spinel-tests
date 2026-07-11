# frozen_string_literal: true
# Float#i (Numeric#i — returns the Complex 0+selfi)
# Direct p() form aborts compilation ("unsupported p argument: CallNode `i`"):
p(3.5.i)
# Assignment form compiles but raises NoMethodError at runtime:
r001 = (3.5.i rescue $!.class); p r001
a001 = -2.5; r002 = (a001.i rescue $!.class); p r002
