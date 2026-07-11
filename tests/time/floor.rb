# frozen_string_literal: true
# Time#floor

p Time.at(1.9).floor.to_i
p Time.at(1.1).floor.to_i
p Time.at(1.9).floor.class
p Time.at(1.9).floor.subsec

a001 = Time.at(1.9)
b001 = a001.floor
p b001.to_i

c002 = Time.utc(2020, 1, 1, 0, 0, 45)
p c002.floor.to_i
d002 = c002.floor
p d002.utc?

p Time.utc(2020, 1, 1, 0, 0, 1, 123456).floor(3).usec
e003 = Time.utc(2020, 1, 1, 0, 0, 1, 123456); f003 = e003.floor(3); p f003.usec

# Every digit count, and the zone the result carries.
g004 = Time.utc(2020, 1, 1, 0, 0, 1, 999999)
p g004.floor(0).usec, g004.floor(1).usec, g004.floor(3).usec, g004.floor(6).usec, g004.floor(9).usec
p g004.floor(3).utc?
p g004.getlocal("+02:00").floor(3).utc_offset
h004 = g004.floor(6); p h004.nsec

# A negative digit count is rejected.
r005 = (g004.floor(-1) rescue $!.class); p r005
