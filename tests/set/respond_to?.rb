# frozen_string_literal: true
require 'set'

# Set#respond_to?
p(Set[1, 2, 3].respond_to?(:add))
p(Set[1, 2, 3].respond_to?(:definitely_not_a_method_xyz))
a020 = Set[1, 2, 3]; p(a020.respond_to?(:add))
a021 = Set[1, 2, 3]; v021 = a021.respond_to?(:definitely_not_a_method_xyz); p v021
