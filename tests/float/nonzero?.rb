# frozen_string_literal: true
# Float#nonzero? (returns self if nonzero, nil if zero)
# Compiles, but raises NoMethodError at runtime (method missing on Float):
r001 = (3.5.nonzero? rescue $!.class); p r001
r002 = (0.0.nonzero? rescue $!.class); p r002
r003 = ((-0.0).nonzero? rescue $!.class); p r003
a001 = -2.5; r004 = (a001.nonzero? rescue $!.class); p r004
