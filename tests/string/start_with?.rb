# frozen_string_literal: true
# String#start_with?
p("hello".start_with?("he"))
a124 = "hello"; p(a124.start_with?("he"))
a125 = "hello"; b125 = "he"; p(a125.start_with?(b125))
a126 = "hello"; b126 = "he"; c126 = (a126.start_with?(b126)); p c126
# negative / whole-string / empty-prefix cases
p("hello".start_with?("x"))
p("hello".start_with?("hello"))
p("hello".start_with?(""))
p("hello".start_with?("helloo"))
# multiple prefixes: true if any matches
p("hello".start_with?("x", "he"))
p("hello".start_with?("x", "y"))
a127 = "hello"; v127 = (a127.start_with?("x", "he")); p v127
# a Regexp prefix (anchored at the start)
p("hello".start_with?(/he/))
p("hello".start_with?(/lo/))
a128 = "hello"; b128 = /h.l/; p(a128.start_with?(b128))
# multibyte prefix
p("café".start_with?("ca"))
a129 = "café"; b129 = "caf"; p(a129.start_with?(b129))
# multi-arg start_with? on a string yielded by each_line through each_with_object loses its type
r130 = ("ab\ncd\n".each_line.each_with_object([]) { |raw, acc| acc << raw.start_with?("a", "c") } rescue $!.class); p r130

# a splatted argument list held in a variable
sw160 = ["he"]
p("hello".start_with?(*sw160))
vw160 = "hello".start_with?(*sw160); p vw160
# control: the same argument positionally, and a literal array splatted in place
p("hello".start_with?("he"))
p("hello".start_with?(*["he"]))
r001 = ("hello".start_with? rescue $!.class); p r001
# a Regexp that only matches later in the string, and a Regexp held in a variable
z002 = "hello"; v002 = z002.start_with?(/l+/); p v002
z003 = /\Ahe/; p("hello".start_with?(z003))
# three prefixes, only the last matching
p("hello".start_with?("x", "y", "hel"))
z004 = "hello"; v004 = z004.start_with?("x", "y", "hel"); p v004
