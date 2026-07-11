# frozen_string_literal: true
# Array#deconstruct

# An explicit `.deconstruct` call returns the array itself, in both the direct
# `p(...)` and captured forms. The case/in pattern match below (which is what
# deconstruct exists for) also works.
p([1, 2, 3].deconstruct)
a001 = [1, 2, 3].deconstruct
p a001
p([1.1, 2.2, 3.3].deconstruct)
a002 = [1.1, 2.2, 3.3].deconstruct
p a002
p(["a", "b", "c"].deconstruct)
a003 = ["a", "b", "c"].deconstruct
p a003
p([].deconstruct)
a004 = [].deconstruct
p a004
b001 = [1, 2, 3]
p b001.deconstruct
c001 = b001.deconstruct
p c001

# exercised through a real case/in pattern match (this is what invokes deconstruct)
case [1, 2]
in [x001, y001]
  p [x001, y001]
end

case [10, 20, 30]
in [x002, y002, z002]
  p [x002, y002, z002]
end

d001 = [100, 200]
case d001
in [x003, y003]
  p [x003, y003]
end
