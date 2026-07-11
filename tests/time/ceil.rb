# frozen_string_literal: true
# Time#ceil

p Time.at(1.1).ceil.to_i
p Time.at(1.9).ceil.to_i
p Time.at(1.1).ceil.class
p Time.at(2.0).ceil.to_i

a001 = Time.at(1.1)
b001 = a001.ceil
p b001.to_i

c002 = Time.utc(2020, 1, 1, 0, 0, 15)
p c002.ceil.to_i
d002 = c002.ceil
p d002.utc?

p Time.utc(2020, 1, 1, 0, 0, 1, 123456).ceil(3).usec
e003 = Time.utc(2020, 1, 1, 0, 0, 1, 123456); f003 = e003.ceil(3); p f003.usec

# Every digit count, and the zone the result carries.
g004 = Time.utc(2020, 1, 1, 0, 0, 1, 123456)
p g004.ceil(0).usec, g004.ceil(1).usec, g004.ceil(3).usec, g004.ceil(6).usec, g004.ceil(9).usec
p g004.ceil(3).utc?
p g004.getlocal("+02:00").ceil(3).utc_offset
h004 = g004.ceil(6); p h004.nsec

# A negative digit count is rejected.
r005 = (g004.ceil(-1) rescue $!.class); p r005
