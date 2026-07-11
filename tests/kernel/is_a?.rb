# frozen_string_literal: true
# Kernel#is_a?
p(Object.new.is_a?(Kernel))
p(Object.new.is_a?(Object))
p(Object.new.is_a?(String))
a014 = Object.new; p(a014.is_a?(Kernel))
a015 = Object.new; v015 = a015.is_a?(String); p v015
