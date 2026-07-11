# frozen_string_literal: true
# Time#yday

p Time.utc(2026, 7, 16, 13, 45, 30).yday

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.class
p a001.yday

a002 = Time.utc(2026, 7, 16, 13, 45, 30)
b002 = a002.yday
p b002.class
p b002

p Time.at(1_600_000_000).yday

a003 = Time.at(1_600_000_000)
b003 = a003.yday
p b003.class
p b003

# Edges: leap-year Feb 29, Dec 31 in leap vs non-leap year, epoch.
p Time.utc(2020, 2, 29).yday
p Time.utc(2020, 12, 31).yday
p Time.utc(2021, 12, 31).yday
p Time.at(0).utc.yday
c004 = Time.utc(2020, 12, 31)
p c004.yday
