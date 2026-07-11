# frozen_string_literal: true
# Time#getutc

p Time.local(2020, 1, 1).getutc.utc?
p Time.local(2020, 1, 1).getutc.class

a001 = Time.local(2020, 1, 1)
b001 = a001.getutc
p b001.utc?
p b001.class

c002 = Time.local(2020, 1, 1, 12, 0, 0)
d002 = c002.getutc
p (d002.to_i == c002.to_i)
