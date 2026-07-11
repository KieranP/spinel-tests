# frozen_string_literal: true
# Float::MAX_10_EXP (largest decimal exponent — Integer 308 in Ruby)
# Direct p() form aborts compilation (unsupported p argument: ConstantPathNode):
p(Float::MAX_10_EXP)
# Assignment form compiles but raises NameError at runtime (constant undefined):
r001 = (Float::MAX_10_EXP rescue $!.class); p r001
r002 = (Float::MAX_10_EXP.class rescue $!.class); p r002
