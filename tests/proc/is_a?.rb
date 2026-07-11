# frozen_string_literal: true
# Proc#is_a?
p(->(a) { a }.is_a?(Proc))
p(->(a) { a }.is_a?(Object))
p(->(a) { a }.is_a?(String))
a014 = ->(a) { a }; p(a014.is_a?(Proc))
a015 = ->(a) { a }; v015 = a015.is_a?(String); p v015
