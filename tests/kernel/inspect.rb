# frozen_string_literal: true
# Kernel#inspect
p(Object.new.inspect.is_a?(String))
a033 = Object.new; v033 = a033.inspect; p(v033.is_a?(String))
