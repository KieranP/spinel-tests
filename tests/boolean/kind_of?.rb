# frozen_string_literal: true
# TrueClass#kind_of?
p(true.kind_of?(TrueClass))
p(true.kind_of?(Object))
p(true.kind_of?(String))
a016 = true; p(a016.kind_of?(TrueClass))
a017 = true; v017 = a017.kind_of?(String); p v017

# FalseClass#kind_of?
p(false.kind_of?(FalseClass))
p(false.kind_of?(Object))
p(false.kind_of?(String))
a061 = false; p(a061.kind_of?(FalseClass))
a062 = false; v062 = a062.kind_of?(String); p v062
