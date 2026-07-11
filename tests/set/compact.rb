# frozen_string_literal: true
require 'set'

# Set#compact
p(Set[1, nil, 2].compact)
v751 = Set[1, nil, 2].compact; p(v751)
a751 = Set[1, 2]; p(a751.compact)
b751 = Set[nil]; v752 = b751.compact; p(v752)
