# frozen_string_literal: true
# Time#month

p Time.utc(2026, 7, 16, 13, 45, 30).month

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.class
p a001.month

a002 = Time.utc(2026, 7, 16, 13, 45, 30)
b002 = a002.month
p b002.class
p b002

p Time.at(1_600_000_000).month

a003 = Time.at(1_600_000_000)
b003 = a003.month
p b003.class
p b003

# Edges: leap day, epoch, year rollover on +.
p Time.utc(2020, 2, 29).month
p Time.at(0).utc.month
p (Time.utc(2020, 12, 31, 23, 59, 59) + 1).utc.month
c004 = Time.utc(2020, 12, 31, 23, 59, 59) + 1
p c004.utc.month
