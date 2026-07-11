# frozen_string_literal: true
# String#chop!
p((+"hello").chop!)
a01 = +"hello"; a01.chop!; p a01
a02 = +"hello\r\n"; a02.chop!; p a02
a03 = +"hello\r\n"; c03 = (a03.chop!); p c03
# empty string returns nil (no change)
p((+"").chop!)
a04 = +""; c04 = (a04.chop!); p c04
# chop! should drop the last character, not its last byte, on a multibyte receiver
a05 = +"café"; a05.chop!; p a05.bytes
a06 = +"café"; c06 = (a06.chop!); p c06.bytes
