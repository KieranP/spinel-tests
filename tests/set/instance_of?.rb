# frozen_string_literal: true
require 'set'

# Set#instance_of?
p(Set[1, 2, 3].instance_of?(Set))
p(Set[1, 2, 3].instance_of?(Array))
a018 = Set[1, 2, 3]; p(a018.instance_of?(Set))
a019 = Set[1, 2, 3]; v019 = a019.instance_of?(Array); p v019
