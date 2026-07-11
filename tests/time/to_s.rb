# frozen_string_literal: true
# Time#to_s

p Time.utc(2026, 7, 16, 13, 45, 30).to_s

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.class
p a001.to_s

a002 = Time.utc(2026, 7, 16, 13, 45, 30)
b002 = a002.to_s
p b002.class
p b002

p Time.at(1_600_000_000).to_s

a003 = Time.at(1_600_000_000)
b003 = a003.to_s
p b003.class
p b003

# Edges: epoch, pre-epoch, a UTC time renders with a " UTC" suffix.
p Time.at(0).utc.to_s
p Time.utc(1969, 12, 31, 23, 59, 59).to_s
c004 = Time.utc(2000, 1, 1, 0, 0, 0)
p c004.to_s
