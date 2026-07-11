# frozen_string_literal: true
# Time#sec

p Time.utc(2026, 7, 16, 13, 45, 30).sec

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.class
p a001.sec

a002 = Time.utc(2026, 7, 16, 13, 45, 30)
b002 = a002.sec
p b002.class
p b002

p Time.at(1_600_000_000).sec

a003 = Time.at(1_600_000_000)
b003 = a003.sec
p b003.class
p b003

# Edges: epoch, pre-epoch, minute boundary.
p Time.at(0).utc.sec
p Time.at(-1).utc.sec
p Time.utc(2020, 1, 1, 0, 0, 59).sec
c004 = Time.at(-1).utc
p c004.sec
