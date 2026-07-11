# frozen_string_literal: true
# Proc#to_s
p(->(a) { a }.to_s.is_a?(String))
a035 = ->(a) { a }; v035 = a035.to_s; p(v035.is_a?(String))
