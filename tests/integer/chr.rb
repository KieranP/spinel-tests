# frozen_string_literal: true
# Integer#chr
p(65.chr)
a032 = 65; p(a032.chr)
a033 = 65; c033 = (a033.chr); p c033

# Non-printable / high bytes: chr returns an ASCII-8BIT/US-ASCII binary string.
# Spinel is UTF-8-only (no per-string encoding), so inspect renders control bytes
# as \uXXXX and byte 0xFF decodes to the replacement char instead of "\xFF".
# WONTFIX: See docs/limitations.md - "Fundamental limits — Mixed / non-UTF-8 encodings"
# p(0.chr)
# p(127.chr)
# p(255.chr)
# ch01 = 0; p(ch01.chr)
# ch02 = 255; cch02 = (ch02.chr); p cch02

# Out-of-range → RangeError
p((256.chr rescue $!.class))
p(((-1).chr rescue $!.class))
ch03 = 256; p((ch03.chr rescue $!.class))
ch04 = -1; p((ch04.chr rescue $!.class))
