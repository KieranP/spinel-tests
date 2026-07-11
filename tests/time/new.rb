# frozen_string_literal: true
# Time.new

p Time.new(2020, 3, 4, 5, 6, 7).year
p Time.new(2020, 3, 4).mon

a001 = Time.new(2020, 3, 4, 5, 6, 7)
p a001.class
p a001.hour

b002 = Time.new(2020, 3, 4)
c002 = b002.day
p c002

p Time.new.class

p Time.new(2020, 1, 1, 0, 0, 0, "+09:00").utc_offset
d003 = Time.new(2020, 1, 1, 0, 0, 0, 32400)
p d003.utc_offset

p Time.new(2020, 1, 1, 0, 0, 0, in: "+05:00").utc_offset
p Time.new("2020", "3", "4").day
p Time.new(2020, 1, 1, 0, 0, 0, in: 3600).utc_offset
e004 = Time.new(2020, 1, 1, 12, 0, 0, "+09:00")
p e004.utc_offset
p e004.hour
p e004.getutc.hour
p e004.zone
p Time.new(2020, 2, 29).mday
p Time.new(2020, 1, 1, 0, 0, 30).sec

# Only a literal "+HH:MM"/"-HH:MM" String is accepted as the zone argument; every other
# spelling — and even a variable holding a valid one — is rejected before any C is emitted.
p Time.new(2020, 1, 1, 0, 0, 0, "UTC").utc?
p Time.new(2020, 1, 1, 0, 0, 0, "Z").utc?
p Time.new(2020, 1, 1, 0, 0, 0, "+0900").utc_offset
p Time.new(2020, 1, 1, 0, 0, 0, "+09:00:30").utc_offset
p Time.new(2020, 1, 1, 0, 0, 0, in: "UTC").utc?
z005 = "+09:00"; p Time.new(2020, 1, 1, 0, 0, 0, z005).utc_offset
r006 = (Time.new(2020, 1, 1, 0, 0, 0, "bogus") rescue $!.class); p r006
