# frozen_string_literal: true
# Regexp#respond_to?
p(/ab/.respond_to?(:match))
p(/ab/.respond_to?(:definitely_not_a_method_xyz))
a020 = /ab/; p(a020.respond_to?(:match))
a021 = /ab/; v021 = a021.respond_to?(:definitely_not_a_method_xyz); p v021
