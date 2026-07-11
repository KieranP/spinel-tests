# frozen_string_literal: true
require 'set'

# Set#frozen?
p(Set[1, 2, 3].frozen?)
a004 = Set[1, 2, 3]; p(a004.frozen?)
a005 = Set[1, 2, 3]; v005 = a005.frozen?; p v005
