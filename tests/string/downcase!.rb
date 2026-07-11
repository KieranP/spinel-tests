# frozen_string_literal: true
# String#downcase!
p((+"HELLO").downcase!)
a01 = +"HELLO"; a01.downcase!; p a01
a02 = +"MiXeD 123"; a02.downcase!; p a02
a03 = +"MiXeD 123"; c03 = (a03.downcase!); p c03
# already lowercase returns nil (no change)
p((+"hello").downcase!)
a04 = +"hello"; c04 = (a04.downcase!); p c04
