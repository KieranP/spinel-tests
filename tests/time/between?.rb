# frozen_string_literal: true
# Time#between?

a001 = Time.utc(2026, 1, 1)
lo01 = Time.utc(2000, 1, 1)
hi01 = Time.utc(2030, 1, 1)
p a001.between?(lo01, hi01)
b002 = a001.between?(lo01, hi01)
p b002

p Time.utc(2026, 1, 1).between?(Time.utc(2000, 1, 1), Time.utc(2030, 1, 1))
p Time.utc(1990, 1, 1).between?(lo01, hi01)
p a001.between?(a001, a001)
p Time.utc(2020, 1, 1).getlocal("+09:00").between?(lo01, hi01)
c003 = Time.utc(2035, 1, 1).between?(lo01, hi01); p c003

# Ruby raises ArgumentError for a non-Time bound; the emitted C initializes an sp_Time
# from the Integer instead.
d004 = (a001.between?(1, 2) rescue $!.class); p d004
