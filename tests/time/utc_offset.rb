# frozen_string_literal: true
# Time#utc_offset

p Time.utc(2026, 7, 16, 13, 45, 30).utc_offset

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.class
p a001.utc_offset

a002 = Time.utc(2026, 7, 16, 13, 45, 30)
b002 = a002.utc_offset
p b002.class
p b002

p Time.at(1_600_000_000).utc_offset

a003 = Time.at(1_600_000_000)
b003 = a003.utc_offset
p b003.class
p b003

p Time.utc(2020, 6, 15).getlocal("+05:30").utc_offset
p Time.utc(2020, 6, 15).getlocal("-08:00").utc_offset
p Time.utc(2020, 6, 15).getlocal(19800).utc_offset
c004 = Time.utc(2020, 6, 15).getlocal("+05:45"); p c004.utc_offset
p Time.new(2020, 1, 1, 0, 0, 0, 3600).utc_offset
