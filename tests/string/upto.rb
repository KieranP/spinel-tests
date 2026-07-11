# frozen_string_literal: true
# String#upto
p("a".upto("e").to_a)
a144 = "a"; p(a144.upto("e").to_a)
a145 = "a"; b145 = "e"; p(a145.upto(b145).to_a)
a146 = "a"; b146 = "e"; c146 = (a146.upto(b146).to_a); p c146
r001 = ("a".upto("e", true).to_a rescue $!.class); p r001
z002 = []; (("a".upto("e", true) { |s002| z002 << s002 }) rescue nil); p z002
p("9".upto("11").to_a)
z003 = "9"; b003 = "11"; v003 = z003.upto(b003).to_a; p v003
# carrying and equal / inverted bounds
p("az".upto("bc").to_a)
z004 = "az"; v004 = z004.upto("bc").to_a; p v004
p("a".upto("a").to_a)
p("b".upto("a").to_a)
z005 = []; r005 = (("a".upto("c") { |s005| z005 << s005 }) rescue $!.class); p z005; p r005
# discarding the result iterates correctly
z006 = []; "a".upto("c") { |s006| z006 << s006 }; p z006
