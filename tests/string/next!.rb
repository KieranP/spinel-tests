# frozen_string_literal: true
# String#next!
p((+"az").next!)
a01 = +"az"; a01.next!; p a01
a02 = +"Zz"; a02.next!; p a02
a03 = +"a9"; c03 = (a03.next!); p c03
# carry rolls over the leftmost alnum
a04 = +"zz99"; a04.next!; p a04
a05 = +"<<koala>>"; a05.next!; p a05
