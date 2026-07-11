# frozen_string_literal: true
# Time#ctime

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.ctime
b002 = Time.utc(2026, 7, 16, 13, 45, 30)
c002 = b002.ctime
p c002

p Time.utc(2020, 1, 2, 3, 4, 5).ctime
p Time.utc(2020, 11, 20, 13, 4, 5).ctime
p Time.utc(2020, 1, 2, 3, 4, 5).getlocal("-08:00").ctime
p Time.utc(1960, 5, 4, 3, 2, 1).ctime
p Time.at(0).utc.ctime
d003 = Time.utc(2020, 1, 2, 3, 4, 5).ctime; p d003.class
