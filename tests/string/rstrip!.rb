# frozen_string_literal: true
# String#rstrip!
p((+"  hello  ").rstrip!)
a01 = +"  hello  "; a01.rstrip!; p a01
a02 = +"hello \t\r\n"; a02.rstrip!; p a02
a03 = +"hello \t\r\n"; c03 = (a03.rstrip!); p c03
# no trailing whitespace returns nil (no change)
p((+"  hello").rstrip!)
a04 = +"  hello"; c04 = (a04.rstrip!); p c04
