# frozen_string_literal: true
# TrueClass#instance_exec (block form)
p(true.instance_exec { self })
p(true.instance_exec(5) { |n| n })
a001 = true; v001 = a001.instance_exec(2) { |n| n }; p v001
a002 = true; v002 = a002.instance_exec { self.class }; p v002

# FalseClass#instance_exec (block form)
p(false.instance_exec { self })
p(false.instance_exec(9) { |n| n })
a003 = false; v003 = a003.instance_exec(3) { |n| n }; p v003
a004 = false; v004 = a004.instance_exec { self }; p v004

# A block that declares a parameter but does not use it aborts C compilation, so this
# stays commented:
p(true.instance_exec(5) { |o| self })
