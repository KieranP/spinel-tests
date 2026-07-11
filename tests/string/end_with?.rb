# frozen_string_literal: true
# String#end_with?
p("hello".end_with?("lo"))
a059 = "hello"; p(a059.end_with?("lo"))
a060 = "hello"; b060 = "lo"; p(a060.end_with?(b060))
a061 = "hello"; b061 = "lo"; c061 = (a061.end_with?(b061)); p c061
# negative / whole-string / empty-suffix cases
p("hello".end_with?("x"))
p("hello".end_with?("hello"))
p("hello".end_with?(""))
p("hello".end_with?("hhello"))
# multiple suffixes: true if any matches
p("hello".end_with?("x", "lo"))
p("hello".end_with?("x", "y"))
a062 = "hello"; v062 = (a062.end_with?("x", "lo")); p v062
# multibyte suffix
p("café".end_with?("fé"))
a063 = "café"; b063 = "fé"; p(a063.end_with?(b063))

# a splatted argument list held in a variable
se160 = ["lo"]
p("hello".end_with?(*se160))
ve160 = "hello".end_with?(*se160); p ve160
# control: the same argument positionally, and a literal array splatted in place
p("hello".end_with?("lo"))
p("hello".end_with?(*["lo"]))
r001 = ("hello".end_with? rescue $!.class); p r001
# three suffixes, only the last matching
p("hello".end_with?("x", "y", "llo"))
z002 = "hello"; v002 = z002.end_with?("x", "y", "llo"); p v002
# an empty receiver
p("".end_with?("a"))
p("".end_with?(""))
