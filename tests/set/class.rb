# frozen_string_literal: true
require 'set'

# Set#class
p(Set[1, 2, 3].class)
a001 = Set[1, 2, 3]; p(a001.class)
a002 = Set[1, 2, 3]; v002 = a002.class; p v002

# Set.class
p(Set.class)
v003 = Set.class; p v003
