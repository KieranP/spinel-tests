# frozen_string_literal: true
# String#[]
p("hello"[1, 3])
a013 = "hello"; p(a013[1, 3])
a014 = "hello"; b014 = 1; p(a014[b014, 3])
a015 = "hello"; b015 = 1; c015 = (a015[b015, 3]); p c015
a154 = "hello"; b154 = 1..3; p(a154[b154])
v155 = "hello"; v156 = 1..3; v157 = (v155[v156]); p v157
# character indexing on a multibyte receiver (index by character, not byte)
p("héllo"[1])
p("héllo"[1, 3])
p("héllo"[1..3])
p("café"[-1])
p("a☕b"[1])
a200 = "héllo"; c200 = (a200[1, 3]); p c200
a201 = "café"; b201 = -1; c201 = (a201[b201]); p c201
# Regexp and String index forms
p("héllo"[/l+/])
p("café"["fé"])

# A two-element splat keeps only the first argument: Ruby "el", Spinel "e".
k296 = [1, 2]
p("hello"[*k296])
v296 = "hello"[*k296]; p v296
# control: the same arguments spread positionally
p("hello"[1, 2])
