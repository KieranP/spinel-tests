# frozen_string_literal: true
# Time#mon

p Time.utc(2026, 7, 16, 13, 45, 30).mon

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.class
p a001.mon

a002 = Time.utc(2026, 7, 16, 13, 45, 30)
b002 = a002.mon
p b002.class
p b002

p Time.at(1_600_000_000).mon

a003 = Time.at(1_600_000_000)
b003 = a003.mon
p b003.class
p b003
