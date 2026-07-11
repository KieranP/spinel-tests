# frozen_string_literal: true
# String#each_char
p("abc".each_char.to_a)
a053 = "abc"; p(a053.each_char.to_a)
a054 = "abc"; c054 = (a054.each_char.to_a); p c054
# one entry per character (codepoint) on a multibyte receiver
p("héllo".each_char.to_a)
p("a☕b".each_char.to_a)
a055 = "café"; c055 = (a055.each_char.to_a); p c055
a056 = "café"; v056 = (a056.each_char.to_a.length); p v056
# block form collects into an array
r057 = []; "a👍b".each_char { |c057| r057 << c057 }; p r057
a058 = "a👍b"; s058 = []; a058.each_char { |c| s058 << c }; p s058

# A String returned from a method with a `raise` branch loses much of String's
# method table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_ec(oec)
  case oec
  when Integer then "i"
  when String  then "sample text"
  else raise ArgumentError, "no"
  end
end
rb_ec = (raisebr_ec("ab").each_char.to_a rescue $!.class); p rb_ec

# A blockless each_char on a String destructured out of an Array yields an untyped receiver.
pr811 = [0, "hello"]; i811, t811 = pr811
r811 = (t811.each_char.reduce("") { |a811, b811| a811 + b811 } rescue $!.class); p r811
pr812 = [[0, "hello"]]
r812 = (pr812.map { |i812, t812| t812.each_char.to_a } rescue $!.class); p r812

# embedded NUL: one entry per byte, NUL included
p("a\0b".each_char.to_a)
a059ec = "a\0b"; c059ec = a059ec.each_char.to_a; p c059ec
