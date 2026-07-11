# frozen_string_literal: true
require 'set'

# Set#equal?
a026 = Set[1, 2, 3]; p(a026.equal?(a026))
a027 = Set[1, 2, 3]; b027 = Set[1, 2, 3]; p(a027.equal?(b027))
a028 = Set[1, 2, 3]; v028 = a028.equal?(a028); p v028
