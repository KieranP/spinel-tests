# frozen_string_literal: true
require 'set'

# Set#is_a?
p(Set[1, 2, 3].is_a?(Set))
p(Set[1, 2, 3].is_a?(Object))
p(Set[1, 2, 3].is_a?(Array))
a014 = Set[1, 2, 3]; p(a014.is_a?(Set))
a015 = Set[1, 2, 3]; v015 = a015.is_a?(Array); p v015
