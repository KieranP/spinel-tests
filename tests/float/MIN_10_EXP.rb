# frozen_string_literal: true
# Float::MIN_10_EXP (smallest decimal exponent — Integer -307 in Ruby)
# Direct p() form aborts compilation (unsupported p argument: ConstantPathNode):
p(Float::MIN_10_EXP)
# Assignment form compiles but raises NameError at runtime (constant undefined):
r001 = (Float::MIN_10_EXP rescue $!.class); p r001
r002 = (Float::MIN_10_EXP.class rescue $!.class); p r002
