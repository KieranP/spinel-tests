# frozen_string_literal: true
require 'set'

# Set#eql?
p(Set[1, 2, 3].eql?(Set[1, 2, 3]))
a029 = Set[1, 2, 3]; b029 = Set[1, 2, 3]; p(a029.eql?(b029))
a030 = Set[1, 2, 3]; v030 = a030.eql?(a030); p v030
