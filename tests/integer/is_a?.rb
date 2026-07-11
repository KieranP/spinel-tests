# frozen_string_literal: true
# Integer#is_a?
p(5.is_a?(Integer))
p(5.is_a?(Object))
p(5.is_a?(String))
a014 = 5; p(a014.is_a?(Integer))
a015 = 5; v015 = a015.is_a?(String); p v015
