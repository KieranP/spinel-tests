# frozen_string_literal: true
# String#succ!
p((+"az").succ!)
a01 = +"az"; a01.succ!; p a01
a02 = +"Zz"; a02.succ!; p a02
a03 = +"a9"; c03 = (a03.succ!); p c03
# carry rolls over the leftmost alnum
a04 = +"zz99"; a04.succ!; p a04
a05 = +"1.9"; a05.succ!; p a05
