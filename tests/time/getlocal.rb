# frozen_string_literal: true
# Time#getlocal

p Time.utc(2020, 1, 1).getlocal.utc?
p Time.utc(2020, 1, 1).getlocal.class

a001 = Time.utc(2020, 1, 1)
b001 = a001.getlocal
p b001.utc?
p (b001.to_i == a001.to_i)

# An explicit fixed offset must yield a deterministic, machine-independent result:
# two distinct offsets must differ. Compared as booleans so the check is TZ-independent.
p (Time.utc(2020, 1, 1, 12).getlocal("+05:00").utc_offset == Time.utc(2020, 1, 1, 12).getlocal("-05:00").utc_offset)
c002 = Time.utc(2020, 1, 1, 12).getlocal("+05:00").hour
d002 = Time.utc(2020, 1, 1, 12).getlocal("+09:00").hour
p (c002 == d002)

# An explicit offset is machine-independent, so its every property can be printed.
e003 = Time.utc(2020, 6, 15, 12, 0, 0)
p e003.getlocal(19800).utc_offset
p e003.getlocal(19800).hour
p e003.getlocal(19800).min
p e003.getlocal("+05:45").utc_offset
p e003.getlocal("-00:30").utc_offset
p e003.getlocal("+00:00").utc?
p e003.getlocal("+05:30").gmt?
p e003.getlocal("+05:30").dst?
p (e003.getlocal("+05:30").to_i == e003.to_i)
f004 = e003.getlocal("-08:00")
p f004.hour
p f004.mday
p f004.utc_offset
g005 = (e003.getlocal("bogus") rescue $!.class); p g005
h005 = (e003.getlocal(99999999) rescue $!.class); p h005
