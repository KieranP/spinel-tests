# frozen_string_literal: true
# NilClass#respond_to?
p(nil.respond_to?(:to_a))
p(nil.respond_to?(:definitely_not_a_method_xyz))
a020 = nil; p(a020.respond_to?(:to_a))
a021 = nil; v021 = a021.respond_to?(:definitely_not_a_method_xyz); p v021
