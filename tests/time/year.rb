# frozen_string_literal: true
# Time#year

p Time.utc(2026, 7, 16, 13, 45, 30).year

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.class
p a001.year

a002 = Time.utc(2026, 7, 16, 13, 45, 30)
b002 = a002.year
p b002.class
p b002

p Time.at(1_600_000_000).year

a003 = Time.at(1_600_000_000)
b003 = a003.year
p b003.class
p b003

# Edges: epoch, pre-epoch, pre-1970.
p Time.at(0).utc.year
p Time.at(-1).utc.year
p Time.utc(1900, 1, 1).year
c004 = Time.at(-1).utc
p c004.year
