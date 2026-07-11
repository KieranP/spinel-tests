# frozen_string_literal: true
# Range#each
(1..3).each { |x| p x }
a001 = (1..3); a001.each { |x| p x }
r002 = []; (1..3).each { |x| r002 << x }; p r002
a003 = (1..3); v003 = a003.each { |x| x }; p(v003)
# blockless -> external Enumerator
p((1..3).each.to_a)
v004 = ((1..3).each.to_a); p(v004)
p((1..3).each.class)
e005 = (1..5).each; p(e005.next); p(e005.next)
# other varieties
r006 = []; (1...4).each { |x| r006 << x }; p r006
("a".."c").each { |x007| p x007 }
r007 = []; ("a".."c").each { |x| r007 << x }; p r007
r008 = []; (5..1).each { |x| r008 << x }; p r008
r009 = []; (-2..2).each { |x| r009 << x }; p r009
# beginless each -> TypeError
r010 = (((..5).each { |x| x }) rescue $!.class); p r010

# As a method's implicit return value this yields a zero value of the receiver's
# type instead of the receiver itself.
def ir809(x809); x809.each { |e809| nil }; end
p ir809((1..2))
v809 = ir809((1..2)); p v809
# control: the same call with the result consumed explicitly
def ic809(y809); return y809.each { |e809| nil }; end
p ic809((1..2))

# the same iterator in the tail position of a BLOCK aborts the C build
# Kept commented: the compile abort takes down the whole file.
def by809; yield((1..2)); end
p(by809 { |r819| r819.each { |e819| nil } })
w819 = by809 { |r820| r820.each { |e820| nil } }; p w819
# control: the same call with the result consumed inside the block
def bc809; yield((1..2)); end
p(bc809 { |r821| q821 = r821.each { |e821| nil }; q821 })
u821 = bc809 { |r822| q822 = r822.each { |e822| nil }; q822 }; p u821
