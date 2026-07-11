# frozen_string_literal: true
# Time#iso8601

p Time.utc(2026, 7, 16, 13, 45, 30).iso8601

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.class
p a001.iso8601

a002 = Time.utc(2026, 7, 16, 13, 45, 30)
b002 = a002.iso8601
p b002.class
p b002

p Time.at(1_600_000_000).utc.iso8601

t003 = Time.utc(2020, 1, 1, 0, 0, 0, 500000)
p t003.iso8601(3)
p t003.iso8601(6)
r003 = t003.iso8601(3)
p r003

p t003.iso8601(0)
p t003.iso8601(1)
p t003.iso8601(9)
v004 = t003.iso8601(9); p v004
s005 = Time.utc(2020, 1, 2, 3, 4, 5, 678901)
p s005.getlocal("+05:30").iso8601
p s005.getlocal("+05:30").iso8601(3)
p s005.getlocal("-08:00").iso8601
v005 = s005.getlocal("+05:30").iso8601(6); p v005
p Time.utc(1960, 5, 4, 3, 2, 1).iso8601
p Time.at(0).utc.iso8601
r006 = (s005.iso8601(-1) rescue $!.class); p r006
