# frozen_string_literal: true
# Float::MIN_EXP (smallest binary exponent — Integer -1021 in Ruby)
# Direct p() form aborts compilation (unsupported p argument: ConstantPathNode):
p(Float::MIN_EXP)
# Assignment form compiles but raises NameError at runtime (constant undefined):
r001 = (Float::MIN_EXP rescue $!.class); p r001
r002 = (Float::MIN_EXP.class rescue $!.class); p r002
