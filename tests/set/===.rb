# frozen_string_literal: true
require 'set'

# Set#=== (membership)
p(Set[1, 2, 3] === 2)
v004 = (Set[1, 2, 3] === 2); p(v004)
p(Set[1, 2, 3] === 9)

# String elements
p(Set["a", "b"] === "a")
a004 = Set["a", "b"]; b004 = "b"; p(a004 === b004)

# Symbol elements
c004 = Set[:x, :y]; d004 = (c004 === :y); p(d004)
