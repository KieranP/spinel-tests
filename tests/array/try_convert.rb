# frozen_string_literal: true
# Array.try_convert

# array arg -> the array
p(Array.try_convert([1, 2]))
a001 = Array.try_convert([1, 2])
p a001

# string arg -> nil
p(Array.try_convert("x"))
a002 = Array.try_convert("x")
p a002

# nil arg -> nil
p(Array.try_convert(nil))
a003 = Array.try_convert(nil)
p a003

# integer arg -> nil
p(Array.try_convert(1))
a004 = Array.try_convert(1)
p a004

# arg in a variable
b001 = [3, 4, 5]
p Array.try_convert(b001)
c001 = Array.try_convert(b001)
p c001

b002 = "hello"
p Array.try_convert(b002)
c002 = Array.try_convert(b002)
p c002
