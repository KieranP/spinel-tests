# frozen_string_literal: true
require 'set'

# Set#kind_of?
p(Set[1, 2, 3].kind_of?(Set))
p(Set[1, 2, 3].kind_of?(Object))
p(Set[1, 2, 3].kind_of?(Array))
a016 = Set[1, 2, 3]; p(a016.kind_of?(Set))
a017 = Set[1, 2, 3]; v017 = a017.kind_of?(Array); p v017
