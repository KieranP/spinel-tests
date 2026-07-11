# frozen_string_literal: true
# Time#utc?

p Time.utc(2026, 7, 16, 13, 45, 30).utc?

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.class
p a001.utc?

a002 = Time.utc(2026, 7, 16, 13, 45, 30)
b002 = a002.utc?
p b002.class
p b002

p Time.at(1_600_000_000).utc?

a003 = Time.at(1_600_000_000)
b003 = a003.utc?
p b003.class
p b003

# Edges: getutc / utc conversions flag the result UTC; the utc-flag is offset-independent.
p Time.at(0).getutc.utc?
p Time.at(0).utc.utc?
c004 = Time.at(1_600_000_000).getutc
p c004.utc?
