# frozen_string_literal: true
# Time#wday

p Time.utc(2026, 7, 16, 13, 45, 30).wday

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.class
p a001.wday

a002 = Time.utc(2026, 7, 16, 13, 45, 30)
b002 = a002.wday
p b002.class
p b002

p Time.at(1_600_000_000).wday

a003 = Time.at(1_600_000_000)
b003 = a003.wday
p b003.class
p b003

# Edges: epoch (Thursday = 4), pre-epoch, a known Sunday.
p Time.at(0).utc.wday
p Time.at(-1).utc.wday
p Time.utc(2020, 1, 5).wday
c004 = Time.at(0).utc
p c004.wday
