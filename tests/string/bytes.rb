# frozen_string_literal: true
# String#bytes
p("abc".bytes)
a016 = "abc"; p(a016.bytes)
a017 = "abc"; c017 = (a017.bytes); p c017
# bytes yields the UTF-8 bytes of each character (more entries than characters)
p("café".bytes)
p("☕".bytes)
a020 = "héllo"; c020 = (a020.bytes); p c020
a021 = "café"; v021 = (a021.bytes.length); p v021
p("".bytes)
