# frozen_string_literal: true
# Time#<=>

p (Time.utc(2020, 1, 1) <=> Time.utc(2020, 1, 2))
p (Time.utc(2020, 1, 2) <=> Time.utc(2020, 1, 1))
p (Time.utc(2020, 1, 1) <=> Time.utc(2020, 1, 1))

a001 = Time.utc(2020, 1, 1)
b001 = Time.utc(2020, 6, 1)
p (a001 <=> b001)
c002 = (a001 <=> b001)
p c002.class
p c002

# <=> with a non-Time operand returns nil in ruby, but aborts the C build.
p (Time.utc(2020, 1, 1) <=> 5)
p (Time.utc(2020, 1, 1) <=> "x")

# Edges: subsecond ordering, epoch vs pre-epoch.
p (Time.utc(2020, 1, 1, 0, 0, 0, 1) <=> Time.utc(2020, 1, 1))
p (Time.at(0) <=> Time.at(-1))
d003 = Time.utc(2020, 1, 1, 0, 0, 0, 1)
e003 = Time.utc(2020, 1, 1)
p (d003 <=> e003)
