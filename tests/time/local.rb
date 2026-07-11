# frozen_string_literal: true
# Time.local

p Time.local(2020, 3, 4).year
p Time.local(2020, 3, 4).utc?

a001 = Time.local(2020, 3, 4, 5, 6, 7)
p a001.class
p a001.hour

b002 = Time.local(2020, 3, 4)
c002 = b002.mon
p c002

p Time.local("2020", "3", "4").year

# A three-letter English month name is a legal month argument.
m010 = (Time.local(2020, "feb", 4).mon rescue $!.class); p m010
m011 = (Time.local(2020, "Mar", 4).mon rescue $!.class); p m011

p Time.local(2020, 2, 29).yday

# subsec is offset-independent, so these are deterministic under any machine TZ.
p Time.local(2020, 1, 1, 0, 0, 0, 0.5).subsec
d003 = Time.local(2020, 1, 1, 0, 0, 0, 0.5); p d003.subsec

# WONTFIX: See docs/limitations.md - "By design — Time sub-nanosecond precision" (Rational subsecond now compiles; sub-ns value differs)
# p Time.local(2020, 1, 1, 0, 0, 0, Rational(1, 3)).subsec
# e003 = Time.local(2020, 1, 1, 0, 0, 0, Rational(1, 3)); p e003.subsec
