# frozen_string_literal: true
# Float#real? (always true — a Float is a real number)
# Compiles, but raises NoMethodError at runtime (method missing on Float):
r001 = (3.5.real? rescue $!.class); p r001
r002 = (Float::NAN.real? rescue $!.class); p r002
a001 = -2.5; r003 = (a001.real? rescue $!.class); p r003
