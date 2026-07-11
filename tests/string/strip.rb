# frozen_string_literal: true
# String#strip
p("  x  ".strip)
a127 = "  x  "; p(a127.strip)
a128 = "  x  "; c128 = (a128.strip); p c128
# strips leading/trailing spaces, tabs, newlines, carriage returns, form feeds and NUL
p("\t\n x \r\n".strip)
p("\v\f x \f\v".strip)
p("\x00x\x00".strip)
# interior whitespace is preserved
p("  a  b  ".strip)
# all-whitespace and empty strings
p("     ".strip)
p("".strip)
a129 = "     "; c129 = (a129.strip); p c129
# nothing to strip returns an equal (fresh) string
p("x".strip)
a130 = "abc"; c130 = (a130.strip); p c130
# strip does not mutate the receiver
a131 = "  x  "; a131.strip; p a131
