# frozen_string_literal: true
# Float#imaginary (alias of #imag)
# Direct p() form aborts compilation ("unsupported p argument: CallNode `imaginary`"):
p(3.5.imaginary)
# Assignment form compiles but raises NoMethodError at runtime:
r001 = (3.5.imaginary rescue $!.class); p r001
a001 = -2.5; r002 = (a001.imaginary rescue $!.class); p r002
