# frozen_string_literal: true
# Time#to_a

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.to_a
b002 = Time.utc(2026, 7, 16, 13, 45, 30)
c002 = b002.to_a
p c002

# Edges: leap day, epoch, year rollover on +.
p Time.utc(2020, 2, 29, 12, 0, 0).to_a
p Time.at(0).utc.to_a
d003 = Time.utc(2020, 12, 31, 23, 59, 59) + 1
p d003.to_a
e004 = Time.at(0).utc
f004 = e004.to_a
p f004
