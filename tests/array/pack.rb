# frozen_string_literal: true
# Array#pack

p([65, 66, 67].pack("C*"))

a001 = [65, 66, 67]
p a001.class
p a001.pack("C*")

a002 = [65, 66, 67]
b002 = "C*"
p b002.class
p a002.pack(b002)

a003 = [65, 66, 67]
b003 = "C*"
c003 = a003.pack(b003)
p c003.class
p c003

p([72, 73, 74].pack("c*"))

a004 = [72, 73, 74]
p a004.class
p a004.pack("c*")

a005 = [72, 73, 74]
b005 = "c*"
p b005.class
p a005.pack(b005)

a006 = [72, 73, 74]
b006 = "c*"
c006 = a006.pack(b006)
p c006.class
p c006

# big-endian / little-endian integer templates (n, N, v), read back as byte arrays
p([258].pack("n").unpack("C*"))
a009 = [258]; c009 = a009.pack("n").unpack("C*"); p c009
p([1].pack("N").bytes)
a010 = [1]; c010 = a010.pack("N").bytes; p c010
p([513].pack("v").unpack("C*"))
a011 = [513]; c011 = a011.pack("v").unpack("C*"); p c011

# space-padded ASCII (A) and hex (H) templates
p(["hi"].pack("A5"))
a012 = ["hi"]; c012 = a012.pack("A5"); p c012
p(["48656c6c6f"].pack("H*"))
a013 = ["48656c6c6f"]; c013 = a013.pack("H*"); p c013

# bit-string template (B)
p([255].pack("C").unpack("B8"))
a014 = [255]; c014 = a014.pack("C").unpack("B8"); p c014

# NUL-padded (a) template: value is byte-correct but inspect renders NUL differently
# WONTFIX: See docs/limitations.md - "By design — Embedded NUL bytes: byte-exact core, C-string transforms"
# p(["hi"].pack("a5"))
# a015 = ["hi"]; c015 = a015.pack("a5"); p c015

# WONTFIX: See docs/limitations.md - "Fundamental limits — Mixed / non-UTF-8 encodings"
# p([255, 128, 0].pack("C*"))
#
# a007 = [255, 128, 0]
# p a007.class
# p a007.pack("C*")
#
# a008 = [255, 128, 0]
# b008 = "C*"
# c008 = a008.pack(b008)
# p c008.class
# p c008

# byte-level round-trips match; only inspect's rendering of the non-printable
# bytes differs (Spinel has no ASCII-8BIT encoding, so it prints \uXXXX where
# CRuby prints \xXX).
p([65, 66, 67].pack("C*"))
h071 = [65, 66, 67]; w071 = h071.pack("C*"); p w071
p([255, 0, 128].pack("C*").bytes)
w072 = [255, 0, 128].pack("C*").bytes; p w072
p([1, 2].pack("N*").bytes)
w073 = [1, 2].pack("N*").bytes; p w073
p([1, 2].pack("s*").bytesize)
p([1.5].pack("d").bytesize)
p(["414243"].pack("H*"))
w074 = ["414243"].pack("H*"); p w074
p(["abc"].pack("m"))
w075 = ["abc"].pack("m"); p w075
p(["abc"].pack("a5").bytes)
p(["abc"].pack("A5"))
p(["hi"].pack("Z3").bytes)
# WONTFIX: See docs/limitations.md - "By design — Embedded NUL bytes: byte-exact core, C-string transforms"
# p([1, 2].pack("N*"))
# p(["abc"].pack("a5"))
# p([1, 2].pack("s*"))
# p([1, 2, 3].pack("c3"))
# p(["hi"].pack("Z3"))
