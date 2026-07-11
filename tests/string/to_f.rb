# frozen_string_literal: true
# String#to_f
p("3.14".to_f)
a001 = "3.14"; p(a001.to_f)
a002 = "3.14"; v002 = a002.to_f; p v002
# trailing junk ignored; leading whitespace allowed
p("3.14xyz".to_f)
p("  .5 ".to_f)
# exponent notation
p("1.5e3".to_f)
p("2E-2".to_f)
# no number -> 0.0; empty -> 0.0
p("abc".to_f)
p("".to_f)
# integer string -> float
p("42".to_f)
# underscores between digits are allowed by Ruby
p("1_000.5".to_f)
a003 = "1_000.5"; v003 = a003.to_f; p v003
