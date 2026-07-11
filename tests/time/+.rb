# frozen_string_literal: true
# Time#+

p (Time.utc(2020, 1, 1) + 60).min
p (Time.utc(2020, 1, 1) + 3600).hour

a001 = Time.utc(2020, 1, 1, 0, 0, 0)
p (a001 + 90).sec

b002 = Time.utc(2020, 1, 1)
c002 = 3661
d002 = b002 + c002
p d002.class
p d002.strftime("%H:%M:%S")

e003 = Time.utc(2020, 1, 1)
f003 = e003 + 0.5
p f003.subsec
p f003.class

p (Time.utc(2020, 1, 1) + 86400).mday

# A Rational number of seconds keeps the fraction (literal and variable receiver).
p (Time.utc(2020, 1, 1) + Rational(1, 2)).subsec
g004 = Time.utc(2020, 1, 1)
h004 = g004 + Rational(3, 2)
p h004.subsec

# Edges: end-of-year rollover carries date fields; the added seconds cross into next year.
p (Time.utc(2020, 12, 31, 23, 59, 59) + 1).to_a
i005 = Time.utc(2020, 12, 31, 23, 59, 59) + 1
p i005.year
p i005.mon
p i005.day
p (Time.utc(2020, 1, 1) + 86400).mday
p (Time.at(0) + (-1)).to_i

# A fixed-offset receiver keeps its offset through the addition.
j006 = Time.utc(2020, 1, 2, 3, 4, 5).getlocal("+02:00") + 60
p j006.utc_offset
p j006.hour
p j006.min
k006 = j006 + 3600; p k006.hour
p (Time.utc(2020, 1, 1) + (2**31)).year

# An operand that is neither Integer, Float nor Rational raises TypeError in Ruby, but
# is passed straight to the integer-seconds parameter of the emitted C.
l007 = (Time.utc(2020, 1, 1) + "x" rescue $!.class); p l007

m007 = Time.utc(2020, 1, 1); n007 = (m007 + m007 rescue $!.class); p n007
