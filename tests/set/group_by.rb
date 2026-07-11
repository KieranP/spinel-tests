# frozen_string_literal: true
require 'set'

# Set#group_by (from Enumerable) -> Hash of value => Array
p(Set[1, 2, 3, 4, 5, 6].group_by { |x| x % 3 }.transform_values(&:sort))
a341 = Set[1, 2, 3, 4, 5, 6]; b341 = a341.group_by { |x| x % 3 }.transform_values(&:sort); p(b341)

# group by parity
c341 = Set[1, 2, 3, 4]; d341 = (c341.group_by(&:even?).transform_values(&:sort)); p(d341)

# String elements grouped by length
e341 = Set["a", "bb", "cc", "ddd"]; f341 = e341.group_by { |x| x.length }.transform_values(&:sort); p(f341)
