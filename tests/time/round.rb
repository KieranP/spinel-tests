# frozen_string_literal: true
# Time#round

p Time.at(1.5).round.to_i
p Time.at(1.4).round.to_i
p Time.at(2.5).round.to_i
p Time.at(1.5).round.class
p Time.at(1.5).round.subsec

a001 = Time.at(1.4)
b001 = a001.round
p b001.to_i

# Whole-second receiver rounds to itself.
c002 = Time.utc(2020, 1, 1, 0, 0, 30)
p c002.round.to_i
d002 = c002.round
p d002.utc?

p Time.utc(2020, 1, 1, 0, 0, 1, 500000).round(3).usec
e003 = Time.utc(2020, 1, 1, 0, 0, 1, 500000); f003 = e003.round(3); p f003.usec

# Every digit count, and the zone the result carries.
g004 = Time.utc(2020, 1, 1, 0, 0, 1, 123456)
p g004.round(0).usec, g004.round(1).usec, g004.round(3).usec, g004.round(6).usec, g004.round(9).usec
p g004.round(3).utc?
p g004.getlocal("+02:00").round(3).utc_offset
h004 = g004.round(6); p h004.nsec

# A negative digit count is rejected.
r005 = (g004.round(-1) rescue $!.class); p r005
