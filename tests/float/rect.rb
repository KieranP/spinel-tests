# frozen_string_literal: true
# Float#rect (rectangular form: [real, imaginary])
# Direct p() form aborts compilation ("unsupported p argument: CallNode `rect`"):
p(3.5.rect)
# Assignment form compiles but raises NoMethodError at runtime:
r001 = (3.5.rect rescue $!.class); p r001
a001 = -2.5; r002 = (a001.rect rescue $!.class); p r002
