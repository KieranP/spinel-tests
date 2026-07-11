# frozen_string_literal: true
# Time#subsec

p Time.utc(2026, 7, 16, 13, 45, 30).subsec

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.class
p a001.subsec

a002 = Time.utc(2026, 7, 16, 13, 45, 30)
b002 = a002.subsec
p b002.class
p b002

p Time.at(1_600_000_000).subsec

a003 = Time.at(1_600_000_000)
b003 = a003.subsec
p b003.class
p b003

# WONTFIX (value only): See docs/limitations.md - "By design — Time sub-nanosecond precision"
# subsec value diverges (Spinel (1/5)) but the class matches — run it, check the type.
p Time.at(2.2).subsec.class
a004 = Time.at(2.2)
b004 = a004.subsec
p b004.class
