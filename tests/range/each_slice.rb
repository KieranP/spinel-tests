# frozen_string_literal: true
# Range#each_slice
p((1..5).each_slice(2).to_a)
a009 = (1..5); p(a009.each_slice(2).to_a)
a010 = (1..5); b010 = 2; p(a010.each_slice(b010).to_a)
a011 = (1..5); b011 = 2; c011 = (a011.each_slice(b011).to_a); p c011
p((1...5).each_slice(2).to_a)
p((1..5).each_slice(3).to_a)
p((3..3).each_slice(2).to_a)
p((5..1).each_slice(2).to_a)
p(("a".."e").each_slice(2).to_a)
r012 = []; (1..5).each_slice(2) { |s012| r012 << s012 }; p r012

p((1..10).each_slice(4).to_a)
v013 = ((1..5).each_slice(2).to_a); p v013
p((1..5).each_slice(2).class)
r014 = ((1..5).each_slice(0).to_a rescue $!.class); p r014
p((1..5).each_slice(2) { |s015| s015 })
v017 = (1..5).each_slice(2) { |s017| s017 }; p v017
r016 = ((1..).each_slice(2).first(2) rescue $!.class); p r016
