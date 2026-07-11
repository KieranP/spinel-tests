# frozen_string_literal: true
require 'set'

# Set#drop
p(Set[1, 2, 3].drop(1))
v501 = Set[1, 2, 3].drop(1); p(v501)
a501 = Set[1, 2, 3]; p(a501.drop(0))
b501 = Set["a", "b"]; v502 = b501.drop(5); p(v502)
