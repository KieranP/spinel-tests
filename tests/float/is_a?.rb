# frozen_string_literal: true
# Float#is_a?
p(1.5.is_a?(Float))
p(1.5.is_a?(Object))
p(1.5.is_a?(String))
a014 = 1.5; p(a014.is_a?(Float))
a015 = 1.5; v015 = a015.is_a?(String); p v015
