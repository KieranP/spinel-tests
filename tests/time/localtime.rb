# frozen_string_literal: true
# Time#localtime (in-place converter)

a001 = Time.utc(2020, 1, 1)
a001.localtime
p a001.utc?

b002 = Time.utc(2020, 1, 1)
c002 = b002.localtime
p c002.class
p b002.utc?

# localtime with an explicit fixed offset must yield a deterministic result:
# two distinct offsets must differ. Compared as booleans so the check is TZ-independent.
m003 = Time.utc(2020, 1, 1, 12); m003.localtime("+05:00")
n003 = Time.utc(2020, 1, 1, 12); n003.localtime("-05:00")
p (m003.utc_offset == n003.utc_offset)
p (m003.hour == n003.hour)
