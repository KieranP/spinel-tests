# frozen_string_literal: true
# Time#day

p Time.utc(2026, 7, 16, 13, 45, 30).day

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.class
p a001.day

a002 = Time.utc(2026, 7, 16, 13, 45, 30)
b002 = a002.day
p b002.class
p b002

p Time.at(1_600_000_000).day

a003 = Time.at(1_600_000_000)
b003 = a003.day
p b003.class
p b003

# Edges: leap day, epoch, month rollover on +.
p Time.utc(2020, 2, 29).day
p Time.at(0).utc.day
p (Time.utc(2020, 1, 31) + 86400).utc.day
c004 = Time.utc(2020, 1, 31) + 86400
p c004.utc.day
