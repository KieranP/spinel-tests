# frozen_string_literal: true
# Time#gmt_offset

p Time.utc(2026, 7, 16, 13, 45, 30).gmt_offset

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.class
p a001.gmt_offset

a002 = Time.utc(2026, 7, 16, 13, 45, 30)
b002 = a002.gmt_offset
p b002.class
p b002

p Time.at(1_600_000_000).gmt_offset

a003 = Time.at(1_600_000_000)
b003 = a003.gmt_offset
p b003.class
p b003
