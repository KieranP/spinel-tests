# frozen_string_literal: true
# Range#each_cons
p((1..5).each_cons(2).to_a)
a006 = (1..5); p(a006.each_cons(2).to_a)
a007 = (1..5); b007 = 2; p(a007.each_cons(b007).to_a)
a008 = (1..5); b008 = 2; c008 = (a008.each_cons(b008).to_a); p c008
p((1...5).each_cons(2).to_a)
p((1..5).each_cons(3).to_a)
p((3..3).each_cons(2).to_a)
p((5..1).each_cons(2).to_a)
p(("a".."e").each_cons(2).to_a)
r009 = []; (1..5).each_cons(2) { |s009| r009 << s009 }; p r009

p((1..10).each_cons(4).to_a)
v010 = ((1..5).each_cons(2).to_a); p v010
r011 = ((1..5).each_cons(0).to_a rescue $!.class); p r011
p((1..5).each_cons(2) { |s012| s012 })
v017 = (1..5).each_cons(2) { |s017| s017 }; p v017
v018 = (1..5).each_cons(2) { |s018| s018 }; p v018.class
r013 = ((1..).each_cons(2).first(2) rescue $!.class); p r013
