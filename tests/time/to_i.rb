# frozen_string_literal: true
# Time#to_i

p Time.utc(2026, 7, 16, 13, 45, 30).to_i

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.class
p a001.to_i

a002 = Time.utc(2026, 7, 16, 13, 45, 30)
b002 = a002.to_i
p b002.class
p b002

p Time.at(1_600_000_000).to_i

a003 = Time.at(1_600_000_000)
b003 = a003.to_i
p b003.class
p b003

# Edges: epoch, pre-epoch, and a subsecond receiver truncates toward the second.
p Time.at(0).to_i
p Time.utc(1969, 12, 31, 23, 59, 59).to_i
p Time.at(1.9).to_i
c004 = Time.utc(1969, 12, 31, 23, 59, 59)
p c004.to_i

# A Time read back out of a container.
d005 = [Time.utc(2020, 1, 2)]
p d005[0].year
p d005[0].to_i
e005 = d005[0]
p e005.to_i
f006 = { k: Time.utc(2020, 1, 2) }
p f006[:k].to_i
g006 = f006[:k].to_i; p g006
p [Time.utc(2020, 1, 2), Time.utc(2020, 1, 3)].map(&:to_i)
