# frozen_string_literal: true
# Kernel#class
p(Object.new.class)
a001 = Object.new; p(a001.class)
a002 = Object.new; v002 = a002.class; p v002

# Kernel.class
p(Kernel.class)
v003 = Kernel.class; p v003
