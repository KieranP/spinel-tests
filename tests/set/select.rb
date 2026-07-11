# frozen_string_literal: true
require 'set'

# Set#select
p(Set[1, 2, 3].select { |x| x > 1 })
v015 = Set[1, 2, 3].select { |x| x > 1 }; p(v015.sort)

# String elements
p(Set["apple", "bat", "cat"].select { |x| x.length == 3 }.sort)
a015 = Set["apple", "bat", "cat"]; b015 = (a015.select { |x| x.length == 3 }); p(b015.sort)

# filter alias
c015 = Set[1, 2, 3, 4]; d015 = (c015.filter { |x| x.even? }); p(d015.sort)
