# frozen_string_literal: true
# Kernel#to_s
p(Object.new.to_s.is_a?(String))
a035 = Object.new; v035 = a035.to_s; p(v035.is_a?(String))
