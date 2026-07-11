# frozen_string_literal: true
# Float#conj (conjugate of a real number is itself)
# Direct p() form aborts compilation ("unsupported p argument: CallNode `conj`"):
p(3.5.conj)
# Assignment form compiles but raises NoMethodError at runtime:
r001 = (3.5.conj rescue $!.class); p r001
a001 = -2.5; r002 = (a001.conj rescue $!.class); p r002
