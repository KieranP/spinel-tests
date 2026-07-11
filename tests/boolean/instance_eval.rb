# frozen_string_literal: true
# TrueClass#instance_eval (block form)
p(true.instance_eval { self })
p(true.instance_eval { |o| o })
a001 = true; v001 = a001.instance_eval { self }; p v001
a002 = true; v002 = a002.instance_eval { |o| o.class }; p v002

# FalseClass#instance_eval (block form)
p(false.instance_eval { self })
p(false.instance_eval { |o| o })
a003 = false; v003 = a003.instance_eval { |o| o }; p v003
a004 = false; v004 = a004.instance_eval { self.class }; p v004

# A block that declares a parameter but does not use it aborts C compilation, so this
# stays commented:
p(true.instance_eval { |o| self })
