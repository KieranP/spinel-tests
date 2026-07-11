# frozen_string_literal: true
# Time#inspect

p Time.utc(2026, 7, 16, 13, 45, 30).inspect

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.class
p a001.inspect

a002 = Time.utc(2026, 7, 16, 13, 45, 30)
b002 = a002.inspect
p b002.class
p b002

p Time.at(1_600_000_000).inspect

a003 = Time.at(1_600_000_000)
b003 = a003.inspect
p b003.class
p b003

# inspect keeps the sub-second that to_s drops.
c004 = Time.utc(2020, 1, 2, 3, 4, 5, 678901)
p c004.inspect
p (c004.inspect == c004.to_s)
p Time.utc(2020, 1, 2, 3, 4, 5, 500000).inspect
d005 = Time.utc(2020, 1, 2, 3, 4, 5)
p d005.inspect
p (d005.inspect == d005.to_s)
p d005.getlocal("+05:30").inspect
e006 = d005.getlocal("-08:00"); f006 = e006.inspect; p f006
p Time.utc(1960, 5, 4, 3, 2, 1).inspect
p Time.at(0).utc.inspect
