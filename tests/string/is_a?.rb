# frozen_string_literal: true
# String#is_a?
p("abc".is_a?(String))
p("abc".is_a?(Object))
p("abc".is_a?(Array))
a014 = "abc"; p(a014.is_a?(String))
a015 = "abc"; v015 = a015.is_a?(Array); p v015
