# frozen_string_literal: true
# String#capitalize
p("hELLO".capitalize)
a020 = "hELLO"; p(a020.capitalize)
a021 = "hELLO"; c021 = (a021.capitalize); p c021
# empty / already-capitalized / all-caps
p("".capitalize)
p("Hello".capitalize)
p("HELLO".capitalize)
# leading non-letter is left alone, following letters downcased
p("1abC".capitalize)
p(" abc".capitalize)
p("_abC".capitalize)
# does not affect subsequent words
p("hello WORLD".capitalize)
a022 = "hello WORLD"; c022 = (a022.capitalize); p c022
# capitalize returns a new String, receiver unchanged
a023 = "hELLO"; a023.capitalize; p a023
# non-ASCII case folding needs Unicode case tables Spinel does not carry (cf. limitations.md grapheme_clusters / "no encoding")
# non-ASCII (Latin-1) Unicode case folding
p("éATON".capitalize)
a024 = "éATON"; c024 = (a024.capitalize); p c024
