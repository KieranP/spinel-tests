# frozen_string_literal: true
# Time#==

p (Time.utc(2020, 1, 1) == Time.utc(2020, 1, 1))
p (Time.utc(2020, 1, 1) == Time.utc(2020, 1, 2))

a001 = Time.utc(2020, 1, 1)
b001 = Time.utc(2020, 1, 1)
p (a001 == b001)
c002 = (a001 == b001)
p c002.class
p c002

p (Time.utc(2020, 1, 1) == nil)

# Equality with a non-Time, non-nil operand aborts the C build (ruby returns false/true).
p (Time.utc(2020, 1, 1) == 5)
p (Time.utc(2020, 1, 1) != 5)
p (Time.utc(2020, 1, 1) == "x")

# Edges: a one-nanosecond subsecond difference is not equal; same instant across builders.
p (Time.utc(2020, 1, 1, 0, 0, 0, 1) == Time.utc(2020, 1, 1))
p (Time.at(0) == Time.utc(1970, 1, 1))
d003 = Time.utc(2020, 1, 1, 0, 0, 0, 1)
e003 = Time.utc(2020, 1, 1)
p (d003 == e003)

# The same instant reached through a different zone is still equal.
p (Time.utc(2020, 1, 1).getlocal("+09:00") == Time.utc(2020, 1, 1))
f004 = Time.utc(2020, 1, 1).getlocal("+09:00")
p (f004 == e003)

# A Time read back out of a container.
g005 = [Time.utc(2020, 1, 2)]
p (g005[0] == Time.utc(2020, 1, 2))
p (Time.utc(2020, 1, 2) == g005[0])
h005 = (g005[0] == Time.utc(2020, 1, 2)); p h005
p g005.include?(Time.utc(2020, 1, 2))
