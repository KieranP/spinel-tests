# frozen_string_literal: true
# Time#clamp

a001 = Time.utc(2026, 1, 1)
lo01 = Time.utc(2000, 1, 1)
hi01 = Time.utc(2010, 1, 1)
p a001.clamp(lo01, hi01).year
b002 = a001.clamp(lo01, hi01)
p b002.year

p Time.utc(2005, 1, 1).clamp(lo01, hi01).year
p Time.utc(1990, 1, 1).clamp(lo01, hi01).year
p a001.clamp(lo01, hi01).class
p a001.clamp(a001, a001).to_i
c003 = Time.utc(2005, 6, 1).clamp(lo01, hi01); p c003.to_i

# Ruby raises ArgumentError for a non-Time bound; the emitted C initializes an sp_Time
# from the Integer instead.
d004 = (a001.clamp(1, 2) rescue $!.class); p d004
