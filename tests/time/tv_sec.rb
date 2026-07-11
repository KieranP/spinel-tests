# frozen_string_literal: true
# Time#tv_sec

p Time.utc(2026, 7, 16, 13, 45, 30).tv_sec

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.class
p a001.tv_sec

a002 = Time.utc(2026, 7, 16, 13, 45, 30)
b002 = a002.tv_sec
p b002.class
p b002

p Time.at(1_600_000_000).tv_sec

a003 = Time.at(1_600_000_000)
b003 = a003.tv_sec
p b003.class
p b003

p Time.at(0).tv_sec
p Time.utc(1969, 12, 31, 23, 59, 59).tv_sec
c004 = Time.at(1.9); p c004.tv_sec

# A Time read back out of a container has no #tv_sec.
d005 = [Time.utc(2020, 1, 2)]
e005 = (d005[0].tv_sec rescue $!.class); p e005
