# frozen_string_literal: true
# Time#zone

p Time.utc(2026, 7, 16, 13, 45, 30).zone

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.class
p a001.zone

a002 = Time.utc(2026, 7, 16, 13, 45, 30)
b002 = a002.zone
p b002.class
p b002

p Time.at(1_600_000_000).zone

a003 = Time.at(1_600_000_000)
b003 = a003.zone
p b003.class
p b003

# A Time carrying a numeric offset rather than a named zone has no abbreviation.
p Time.utc(2020, 6, 15, 12, 0, 0).getlocal("+05:30").zone
p Time.utc(2020, 6, 15, 12, 0, 0).getlocal(19800).zone
c004 = Time.utc(2020, 6, 15).getlocal("-08:00")
d004 = c004.zone
p d004
p d004.nil?
p Time.utc(2020, 6, 15).getutc.zone
e005 = Time.utc(2020, 6, 15).zone; p e005.frozen?
