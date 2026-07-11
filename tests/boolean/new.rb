# frozen_string_literal: true
# TrueClass.new
# TrueClass/FalseClass have no public allocator, so `.new` raises NoMethodError in Ruby.
# Spinel raises NameError ("uninitialized constant") instead — a rescue-wrapped probe is
# the assignment form; its direct form aborts the script, so it stays single.
r001 = (TrueClass.new rescue $!.class); p r001

# FalseClass.new
r002 = (FalseClass.new rescue $!.class); p r002
