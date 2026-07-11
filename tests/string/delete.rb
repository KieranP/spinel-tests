# frozen_string_literal: true
# String#delete
p("hello".delete("l"))
a040 = "hello"; p(a040.delete("l"))
a041 = "hello"; b041 = "l"; p(a041.delete(b041))
a042 = "hello"; b042 = "l"; c042 = (a042.delete(b042)); p c042
# deletes by character on a multibyte receiver
p("café".delete("é"))
p("a☕b☕c".delete("☕"))
a043 = "café"; c043 = (a043.delete("é")); p c043
# character range and negation
p("hello world".delete("l-o"))
p("hello".delete("^l"))
# delete returns a new string; receiver unchanged
a044 = "hello"; a044.delete("l"); p a044
p("a-b".delete("a\\-b"))
v_eh = ("a-b".delete("a\\-b")); p v_eh
# the intersection of two selectors, and a negated range
p("hello world".delete("l", "lo"))
v_ms = ("hello world".delete("l", "lo")); p v_ms
p("hello world".delete("^a-y"))
