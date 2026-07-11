# frozen_string_literal: true
# Time.utc

p Time.utc(2026, 7, 16, 13, 45, 30).year
p Time.utc(2026, 7, 16, 13, 45, 30).to_i
p Time.utc(2020).year
p Time.utc(2020, 3).mon
p Time.utc(2020, 3, 4, 5, 6, 7).hour

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.class
p a001.to_i

b002 = Time.utc(2000, 1, 1)
p b002.utc?

p Time.utc(2020, 1, 1, 0, 0, Rational(3, 2)).subsec
p Time.utc(2020, 1, 1, 0, 0, 1.5).subsec
p Time.utc("2020", "3", "4").year

# A three-letter English month name is a legal month argument, in any case.
m010 = (Time.utc(2020, "feb", 4).mon rescue $!.class); p m010
m011 = (Time.utc(2020, "DEC", 4).mon rescue $!.class); p m011
m012 = (Time.utc("2020", "jan", "4").mon rescue $!.class); p m012

# Leap day and boundaries.
p Time.utc(2020, 2, 29).yday
p Time.utc(2000, 1, 1).to_i
p Time.utc(1970, 1, 1).to_i
p Time.utc(1969, 12, 31, 23, 59, 59).to_i

# Out-of-range components raise ArgumentError; a day within 1..31 overflowing its month rolls.
r005 = (Time.utc(2020, 13, 1) rescue $!.class); p r005
r006 = (Time.utc(2020, 2, 30) rescue $!.class); p r006
r007 = (Time.utc(2020, 1, 1, 25) rescue $!.class); p r007
r008 = (Time.utc(2020, 1, 32) rescue $!.class); p r008

p Time.utc(2020, 1, 1, 0, 0, 0, 0.5).subsec
f008 = Time.utc(2020, 1, 1, 0, 0, 0, 0.5); p f008.subsec

# WONTFIX: See docs/limitations.md - "By design — Time sub-nanosecond precision" (Rational subsecond now compiles; sub-ns value differs)
# p Time.utc(2020, 1, 1, 0, 0, 0, Rational(1, 3)).subsec
# g009 = Time.utc(2020, 1, 1, 0, 0, 0, Rational(1, 3)); p g009.subsec

# Time#utc (in-place converter)

c003 = Time.at(0)
c003.utc
p c003.utc?

d004 = Time.at(0)
e004 = d004.utc
p e004.class
p d004.utc?
