# frozen_string_literal: true
# Time#deconstruct_keys

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.deconstruct_keys([:year, :month, :day])
b002 = Time.utc(2026, 7, 16, 13, 45, 30)
c002 = b002.deconstruct_keys(nil)
p c002
p b002.deconstruct_keys([:zone])
d003 = b002.deconstruct_keys([:zone]); p d003
p b002.deconstruct_keys(nil).keys.sort
e004 = b002.deconstruct_keys([:year, :month, :day, :hour, :min, :sec, :subsec, :yday, :wday, :zone]); p e004

# The same Hash drives a hash pattern in case/in.
f005 = Time.utc(2024, 2, 29, 12, 0, 0)
case f005
in { year: 2024 }
  g005 = :matched
else
  g005 = :no_match
end
p g005

case f005
in { year: Integer => h006, month: i006 }
  j006 = [h006, i006]
else
  j006 = :no_match
end
p j006

# The one-line `in` form of the same pattern is rejected before any C is emitted.
k007 = (f005 in { day: 29 }); p k007
