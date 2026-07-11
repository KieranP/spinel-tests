# frozen_string_literal: true
# Array#is_a?
p([1, 2, 3].is_a?(Array))
p([1, 2, 3].is_a?(Object))
p([1, 2, 3].is_a?(String))
a014 = [1, 2, 3]; p(a014.is_a?(Array))
a015 = [1, 2, 3]; v015 = a015.is_a?(String); p v015
