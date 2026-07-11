# frozen_string_literal: true
# String#each_line
p("a\nb\nc".each_line.to_a)
a057 = "a\nb\nc"; p(a057.each_line.to_a)
a058 = "a\nb\nc"; c058 = (a058.each_line.to_a); p c058
# each_line(sep) enumerator form
p("1-2-3".each_line("-").to_a)
v082 = ("1-2-3".each_line("-").to_a); p v082
p("a,1\nb,2\n".each_line.map { |l234| k234a, v234a = l234.strip.split(","); k234a })
r234 = "a,1\nb,2\n".each_line.map { |m234| k234b, v234b = m234.strip.split(","); k234b }; p r234
# the chomp: keyword, in the block and enumerator forms
p("a\nb\nc\n".each_line(chomp: true).to_a)
z001 = []; "a\nb\n".each_line(chomp: true) { |l001| z001 << l001 }; p z001
z002 = []; "1-2-3".each_line("-") { |l002| z002 << l002 }; p z002
v002 = "1-2-3".each_line("-").to_a; p v002
# each_line returns the receiver when given a block
z003 = []; r003 = "a\nb".each_line { |l003| z003 << l003 }; p z003; p r003
# a multibyte separator
p("a☕b☕c".each_line("☕").to_a)
# Struct constructor aborts the C build when another site builds it with a literal Integer.
ElPair905 = Struct.new(:number, :label)
a905 = []; "a\nb\n".each_line.with_index { |r905, i905| a905 << ElPair905.new(i905, r905.to_s) }
p a905.map(&:number)
p ElPair905.new(99, "x").number
