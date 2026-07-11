# frozen_string_literal: true
# Regexp#is_a?
p(/ab/.is_a?(Regexp))
p(/ab/.is_a?(Object))
p(/ab/.is_a?(String))
a014 = /ab/; p(a014.is_a?(Regexp))
a015 = /ab/; v015 = a015.is_a?(String); p v015
