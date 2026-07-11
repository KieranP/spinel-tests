# frozen_string_literal: true
# Time#getgm

a001 = Time.utc(2020, 1, 1)
p a001.getgm.utc?
b002 = Time.utc(2020, 1, 1)
c002 = b002.getgm
p c002.year
