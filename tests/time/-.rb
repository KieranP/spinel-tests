# frozen_string_literal: true
# Time#-

p (Time.utc(2020, 1, 1, 1, 0, 0) - 3600).hour
p (Time.utc(2020, 1, 2) - Time.utc(2020, 1, 1))

a001 = Time.utc(2020, 1, 1, 0, 1, 0)
p (a001 - 60).min

b002 = Time.utc(2020, 1, 1, 12, 0, 0)
c002 = Time.utc(2020, 1, 1, 0, 0, 0)
d002 = b002 - c002
p d002.class
p d002

e003 = Time.utc(2020, 1, 1)
f003 = e003 - 0.5
p f003.subsec

p (Time.utc(2020, 1, 1) - 86400).mday

# A Rational number of seconds keeps the fraction (literal and variable receiver).
p (Time.utc(2020, 1, 1) - Rational(1, 2)).subsec
g004 = Time.utc(2020, 1, 1)
h004 = g004 - Rational(3, 2)
p h004.subsec

# Edges: subtracting into the previous year; Time - Time with a subsecond gap is a Float.
i005 = Time.utc(2021, 1, 1) - 1
p i005.year
p i005.mon
p i005.day
p (Time.utc(2020, 1, 1, 0, 0, 1, 500000) - Time.utc(2020, 1, 1))
j006 = Time.utc(2020, 1, 1, 0, 0, 1, 500000) - Time.utc(2020, 1, 1)
p j006.class
p j006

acr = [Time.at(0), Time.at(3600)]; tmr = ((acr[1] - acr[0]) rescue $!.class); p tmr

# A fixed-offset receiver keeps its offset through the subtraction.
k007 = Time.utc(2020, 1, 2, 3, 4, 5).getlocal("+02:00") - 3600
p k007.utc_offset
p k007.hour
l007 = k007 - 60; p l007.min
p (Time.utc(2020, 1, 1) - (2**31)).year

# An operand that is neither Integer, Float, Rational nor Time raises TypeError in Ruby,
# but is passed straight to the integer-seconds parameter of the emitted C.
m008 = (Time.utc(2020, 1, 1) - "x" rescue $!.class); p m008
