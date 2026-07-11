# frozen_string_literal: true
# TrueClass#is_a?
p(true.is_a?(TrueClass))
p(true.is_a?(Object))
p(true.is_a?(String))
a014 = true; p(a014.is_a?(TrueClass))
a015 = true; v015 = a015.is_a?(String); p v015

# FalseClass#is_a?
p(false.is_a?(FalseClass))
p(false.is_a?(Object))
p(false.is_a?(String))
a059 = false; p(a059.is_a?(FalseClass))
a060 = false; v060 = a060.is_a?(String); p v060
