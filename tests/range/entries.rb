# frozen_string_literal: true
# Range#entries
p((1..5).entries)
a001 = (1..5); p(a001.entries)
a002 = (1..5); c002 = (a002.entries); p c002
p((1...5).entries)
p(("a".."d").entries)
p((5..1).entries)
p((3..3).entries)
p((-3..0).entries)
r003 = ((1..).entries rescue $!.class); p r003
