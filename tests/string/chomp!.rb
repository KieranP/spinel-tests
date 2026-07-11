# frozen_string_literal: true
# String#chomp!
p((+"hello\n").chomp!)
a01 = +"hello\n"; a01.chomp!; p a01
a02 = +"hello\r\n"; a02.chomp!; p a02
a03 = +"hello\r\n"; c03 = (a03.chomp!); p c03
# explicit separator argument
a04 = +"hello.txt"; b04 = +".txt"; a04.chomp!(b04); p a04
a05 = +"hello.txt"; b05 = +".txt"; c05 = (a05.chomp!(b05)); p c05
# no trailing separator returns nil (no change)
p((+"hello").chomp!)
a06 = +"hello"; c06 = (a06.chomp!); p c06
