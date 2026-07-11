# frozen_string_literal: true
# Float#imag (imaginary part of a real number is 0)
# Direct p() form aborts compilation ("unsupported p argument: CallNode `imag`"):
p(3.5.imag)
# Assignment form compiles but raises NoMethodError at runtime:
r001 = (3.5.imag rescue $!.class); p r001
a001 = -2.5; r002 = (a001.imag rescue $!.class); p r002
