# frozen_string_literal: true
# Time#to_f

p Time.utc(2026, 7, 16, 13, 45, 30).to_f

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.class
p a001.to_f

a002 = Time.utc(2026, 7, 16, 13, 45, 30)
b002 = a002.to_f
p b002.class
p b002

p Time.at(1_600_000_000).to_f

a003 = Time.at(1_600_000_000)
b003 = a003.to_f
p b003.class
p b003

# Edges: epoch, pre-epoch, half-second subsecond (round-trips exactly).
p Time.at(0).to_f
p Time.utc(1969, 12, 31, 23, 59, 59).to_f
p Time.at(1.5).to_f
c004 = Time.at(1.5)
p c004.to_f

# A Time read back out of a container.
d005 = [Time.utc(2020, 1, 2)]
p d005[0].year
p d005[0].to_f
e005 = d005[0]
p e005.to_f
f006 = { k: Time.utc(2020, 1, 2) }
g006 = f006[:k].to_f; p g006
