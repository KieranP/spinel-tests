# frozen_string_literal: true
# Time#asctime

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.asctime
b002 = Time.utc(2026, 7, 16, 13, 45, 30)
c002 = b002.asctime
p c002

p Time.utc(2020, 1, 2, 3, 4, 5).asctime
p Time.utc(2020, 11, 20, 13, 4, 5).asctime
p Time.utc(2020, 1, 2, 3, 4, 5).getlocal("+05:30").asctime
p Time.utc(1960, 5, 4, 3, 2, 1).asctime
p Time.at(0).utc.asctime
d003 = Time.utc(2020, 1, 2, 3, 4, 5).asctime; p d003.class
