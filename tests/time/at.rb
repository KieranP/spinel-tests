# frozen_string_literal: true
# Time.at

p Time.at(1_600_000_000).class
p Time.at(1_600_000_000).to_i
p Time.at(1_600_000_000).utc.to_i

a001 = 1_600_000_000
p Time.at(a001).to_i
b001 = Time.at(a001)
p b001.class
p b001.to_i

p Time.at(1_600_000_000.5).utc.to_f
c002 = Time.at(1_600_000_000.5)
p c002.utc.to_f

# WONTFIX (value only): See docs/limitations.md - "By design — Time sub-nanosecond precision"
# to_f value diverges (Spinel 12345.677999999) but the class matches — run it, check the type.
p Time.at(12345.678).to_f.class
v012 = Time.at(12345.678).to_f; p v012.class

t003 = Time.utc(2020, 1, 1)
p Time.at(t003).utc.to_i
d003 = Time.at(t003)
p d003.utc.to_i

p Time.at(Rational(3, 2)).subsec
e004 = Time.at(Rational(3, 2))
p e004.subsec

p Time.at(1_600_000_000, 500_000).usec
v010 = Time.at(1_600_000_000, 500_000).usec; p v010
p Time.at(0, 500, :millisecond).to_f
p Time.at(0, in: "+09:00").utc_offset
v011 = Time.at(0, in: "+09:00").utc_offset; p v011
s013 = 1; p Time.at(s013, in: "+09:00").utc_offset

# Other `in:` forms raise NoMethodError, so each is probed through a rescue.
v013a = (Time.at(0, in: "UTC").utc? rescue $!.class); p v013a
v013b = (Time.at(0, in: "Z").utc? rescue $!.class); p v013b
v013c = (Time.at(0, in: 3600).utc_offset rescue $!.class); p v013c
v014 = (Time.at(0, in: "bogus") rescue $!.class); p v014
v015a = (Time.at(1, 2, in: "+09:00").utc_offset rescue $!.class); p v015a
v015 = (Time.at(0, 500, :millisecond, in: "+09:00").utc_offset rescue $!.class); p v015

# A non-Integer seconds argument combined with `in:` is mistyped in the emitted C.
p Time.at(Rational(3, 2), in: "+09:00").to_f
v016 = Time.at(Rational(3, 2), in: "+09:00").subsec; p v016
p Time.at(Time.utc(2020, 1, 1), in: "+09:00").utc_offset
# The Float form builds but with a -Wliteral-conversion warning, and loses the fraction.
p Time.at(1.5, in: "+09:00").to_f
v017 = Time.at(1.5, in: "+09:00").subsec; p v017

# A sub-second argument of one whole unit or more normalizes into the seconds.
p Time.at(1, 1_000_000).to_i
p Time.at(1, 1_000_000).usec
p Time.at(1, 1_500_000).to_i
v018 = Time.at(1, 1_500_000).usec; p v018
p Time.at(0, 2500, :millisecond).to_f
p Time.at(0, 1_500_000_000, :nanosecond).to_f
p Time.at(2, -1_500_000).to_f
p Time.at(1, -500_000).to_f

# Units, and a negative / pre-epoch seconds argument.
p Time.at(0, 1, :nanosecond).nsec
p Time.at(0, 1, :nsec).nsec
p Time.at(0, 1, :microsecond).nsec
p Time.at(0, 1, :usec).nsec
p Time.at(0, 1, :millisecond).nsec
p Time.at(-1).utc.to_i
p Time.at(-86400).utc.to_s
p Time.at(-1.5).utc.to_f
v019 = Time.at(-1).utc.strftime("%Y-%m-%d %H:%M:%S"); p v019
r020 = (Time.at(0, 0, :bogus) rescue $!.class); p r020
