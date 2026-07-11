# frozen_string_literal: true
# String#ord
p("A".ord)
a086 = "A"; p(a086.ord)
a087 = "A"; c087 = (a087.ord); p c087
# ord returns the codepoint of the first character (not its first byte) on a multibyte receiver
p("☕abc".ord)
p("élan".ord)
a088 = "☕abc"; c088 = (a088.ord); p c088
a089 = "café"; v089 = (a089.ord); p v089
