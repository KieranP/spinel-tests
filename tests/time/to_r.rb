# frozen_string_literal: true
# Time#to_r

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.to_r
b002 = Time.utc(2026, 7, 16, 13, 45, 30)
c002 = b002.to_r
p c002

p Time.at(0).to_r
p Time.utc(2020, 1, 1, 0, 0, 0, 500000).to_r
p Time.utc(1969, 12, 31, 23, 59, 59).to_r
d003 = Time.utc(2020, 1, 1, 0, 0, 0, 500000).to_r; p d003.class

# A Time read back out of a container has no #to_r.
e004 = [Time.utc(2020, 1, 2)]
f004 = (e004[0].to_r rescue $!.class); p f004
