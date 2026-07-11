# frozen_string_literal: true
# String#bytesize
p("abc".bytesize)
a018 = "abc"; p(a018.bytesize)
a019 = "abc"; c019 = (a019.bytesize); p c019
# bytesize counts bytes (UTF-8 encoded length), unlike length which counts characters
p("café".bytesize)
p("café".length)
p("☕".bytesize)
p("a👍b".bytesize)
a020 = "héllo"; c020 = (a020.bytesize); p c020
a021 = "héllo"; v021 = (a021.bytesize - a021.length); p v021
p("".bytesize)
