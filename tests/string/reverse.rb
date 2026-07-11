# frozen_string_literal: true
# String#reverse
p("abc".reverse)
a097 = "abc"; p(a097.reverse)
a098 = "abc"; c098 = (a098.reverse); p c098
# reverse operates on whole characters, not bytes, so multibyte chars stay intact
p("héllo".reverse)
p("a☕b🎉c".reverse)
a099 = "café"; c099 = (a099.reverse); p c099
a100 = "café"; v100 = (a100.reverse.length); p v100
# reversing twice restores the original
a101 = "héllo"; v101 = (a101.reverse.reverse == a101); p v101
p("".reverse)
