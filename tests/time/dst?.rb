# frozen_string_literal: true
# Time#dst?

p Time.utc(2026, 7, 16, 13, 45, 30).dst?

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.class
p a001.dst?

a002 = Time.utc(2026, 7, 16, 13, 45, 30)
b002 = a002.dst?
p b002.class
p b002

p Time.at(1_600_000_000).dst?

a003 = Time.at(1_600_000_000)
b003 = a003.dst?
p b003.class
p b003
