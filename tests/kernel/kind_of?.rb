# frozen_string_literal: true
# Kernel#kind_of?
p(Object.new.kind_of?(Kernel))
p(Object.new.kind_of?(Object))
p(Object.new.kind_of?(String))
a016 = Object.new; p(a016.kind_of?(Kernel))
a017 = Object.new; v017 = a017.kind_of?(String); p v017
