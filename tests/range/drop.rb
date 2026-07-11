# frozen_string_literal: true
# Range#drop
p((1..5).drop(2))
a001 = (1..5); p(a001.drop(2))
a002 = (1..5); b002 = 2; p(a002.drop(b002))
a003 = (1..5); b003 = 2; c003 = (a003.drop(b003)); p c003
p((1..5).drop(0))
p((1..5).drop(10))
p((1...5).drop(2))
p((5..1).drop(2))
p(("a".."e").drop(2))
r004 = ((1..5).drop(-1) rescue $!.class); p r004
