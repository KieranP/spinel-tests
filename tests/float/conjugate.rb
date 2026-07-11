# frozen_string_literal: true
# Float#conjugate (alias of #conj)
# Direct p() form aborts compilation ("unsupported p argument: CallNode `conjugate`"):
p(3.5.conjugate)
# Assignment form compiles but raises NoMethodError at runtime:
r001 = (3.5.conjugate rescue $!.class); p r001
a001 = -2.5; r002 = (a001.conjugate rescue $!.class); p r002
