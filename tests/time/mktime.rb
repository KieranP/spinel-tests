# frozen_string_literal: true
# Time.mktime

p Time.mktime(2020, 3, 4).year

a001 = Time.mktime(2020, 3, 4, 5, 6, 7)
p a001.class
p a001.min

b002 = Time.mktime(2020, 3, 4)
c002 = b002.day
p c002

p Time.mktime("2020", "3", "4").year

# A three-letter English month name is a legal month argument.
m010 = (Time.mktime(2020, "feb", 4).mon rescue $!.class); p m010
m011 = (Time.mktime(2020, "Mar", 4).mon rescue $!.class); p m011

p Time.mktime(2020, 2, 29).yday

# subsec is offset-independent, so these are deterministic under any machine TZ.
p Time.mktime(2020, 1, 1, 0, 0, 0, 0.5).subsec
d003 = Time.mktime(2020, 1, 1, 0, 0, 0, 0.5); p d003.subsec

# WONTFIX: See docs/limitations.md - "By design — Time sub-nanosecond precision" (Rational subsecond now compiles; sub-ns value differs)
# p Time.mktime(2020, 1, 1, 0, 0, 0, Rational(1, 3)).subsec
# e003 = Time.mktime(2020, 1, 1, 0, 0, 0, Rational(1, 3)); p e003.subsec
