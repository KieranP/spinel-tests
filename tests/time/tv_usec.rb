# frozen_string_literal: true
# Time#tv_usec

p Time.utc(2026, 7, 16, 13, 45, 30).tv_usec

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.class
p a001.tv_usec

a002 = Time.utc(2026, 7, 16, 13, 45, 30)
b002 = a002.tv_usec
p b002.class
p b002

p Time.at(1_600_000_000).tv_usec

a003 = Time.at(1_600_000_000)
b003 = a003.tv_usec
p b003.class
p b003

p Time.utc(2020, 1, 2, 3, 4, 5, 678901).tv_usec
p Time.at(1234567890, 123456789, :nanosecond).tv_usec
c004 = Time.utc(2020, 1, 1, 0, 0, 0, 500000); p c004.tv_usec
