# frozen_string_literal: true
# Array#respond_to?
p([1, 2, 3].respond_to?(:length))
p([1, 2, 3].respond_to?(:definitely_not_a_method_xyz))
a020 = [1, 2, 3]; p(a020.respond_to?(:length))
a021 = [1, 2, 3]; v021 = a021.respond_to?(:definitely_not_a_method_xyz); p v021
