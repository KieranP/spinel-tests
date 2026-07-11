# frozen_string_literal: true
# Float#integer? (always false — a Float is never an Integer)
# Compiles, but raises NoMethodError at runtime (method missing on Float):
r001 = (3.5.integer? rescue $!.class); p r001
r002 = (3.0.integer? rescue $!.class); p r002
a001 = 3.5; r003 = (a001.integer? rescue $!.class); p r003
