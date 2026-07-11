# frozen_string_literal: true
# String#strip!
p((+"  hello  ").strip!)
a01 = +"  hello  "; a01.strip!; p a01
a02 = +"\t\nhello\r\n "; a02.strip!; p a02
a03 = +"\t\nhello\r\n "; c03 = (a03.strip!); p c03
# no surrounding whitespace returns nil (no change)
p((+"hello").strip!)
a04 = +"hello"; c04 = (a04.strip!); p c04
