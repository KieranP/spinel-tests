# frozen_string_literal: true
# Time.gm

p Time.gm(2026, 7, 16, 13, 45, 30).year
p Time.gm(2026, 7, 16).utc?

a001 = Time.gm(2020, 3, 4)
p a001.class
p a001.mon

b002 = Time.gm(2020, 3, 4)
c002 = b002.yday
p c002

p Time.gm("2020", "3", "4").year

# A three-letter English month name is a legal month argument.
m010 = (Time.gm(2020, "feb", 4).mon rescue $!.class); p m010
m011 = (Time.gm(2020, "Mar", 4).mon rescue $!.class); p m011

p Time.gm(2020, 2, 29).yday
r003 = (Time.gm(2020, 13, 1) rescue $!.class); p r003
r004 = (Time.gm(2020, 0, 1) rescue $!.class); p r004

p Time.gm(2020, 1, 1, 0, 0, 0, 0.5).subsec
d003 = Time.gm(2020, 1, 1, 0, 0, 0, 0.5); p d003.subsec

# WONTFIX: See docs/limitations.md - "By design — Time sub-nanosecond precision" (Rational subsecond now compiles; sub-ns value differs)
# p Time.gm(2020, 1, 1, 0, 0, 0, Rational(1, 3)).subsec
# e003 = Time.gm(2020, 1, 1, 0, 0, 0, Rational(1, 3)); p e003.subsec
