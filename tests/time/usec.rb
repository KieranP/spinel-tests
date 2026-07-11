# frozen_string_literal: true
# Time#usec

p Time.utc(2026, 7, 16, 13, 45, 30).usec

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.class
p a001.usec

a002 = Time.utc(2026, 7, 16, 13, 45, 30)
b002 = a002.usec
p b002.class
p b002

p Time.at(1_600_000_000).usec

a003 = Time.at(1_600_000_000)
b003 = a003.usec
p b003.class
p b003

p Time.utc(2020, 1, 2, 3, 4, 5, 678901).usec
p Time.utc(2020, 1, 1, 0, 0, 0, 500000).usec
p Time.at(1234567890, 123456789, :nanosecond).usec
p Time.utc(1969, 12, 31, 23, 59, 59, 500000).usec
c004 = Time.at(1234567890, 123456789, :nanosecond); p c004.usec
