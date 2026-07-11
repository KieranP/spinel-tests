# frozen_string_literal: true
# String#lstrip!
p((+"  hello  ").lstrip!)
a01 = +"  hello  "; a01.lstrip!; p a01
a02 = +"\t\n hello"; a02.lstrip!; p a02
a03 = +"\t\n hello"; c03 = (a03.lstrip!); p c03
# no leading whitespace returns nil (no change)
p((+"hello  ").lstrip!)
a04 = +"hello  "; c04 = (a04.lstrip!); p c04
