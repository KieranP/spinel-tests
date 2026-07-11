# frozen_string_literal: true
# Proc#inspect
p(->(a) { a }.inspect.is_a?(String))
a033 = ->(a) { a }; v033 = a033.inspect; p(v033.is_a?(String))
