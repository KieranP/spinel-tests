# frozen_string_literal: true
# String#upcase!
p((+"hello").upcase!)
a01 = +"hello"; a01.upcase!; p a01
a02 = +"MiXeD 123"; a02.upcase!; p a02
a03 = +"MiXeD 123"; c03 = (a03.upcase!); p c03
# already uppercase returns nil (no change)
p((+"HELLO").upcase!)
a04 = +"HELLO"; c04 = (a04.upcase!); p c04
# the in-place mutation never reaches the Array
z012 = [+"abc"]; a012 = z012[0]; a012.upcase!; p z012
z013 = [+"abc"]; a013 = z013[0]; a013.upcase!; v013 = a013.equal?(z013[0]); p v013

# the return value as nil
a952 = +"abc"; v952 = a952.upcase!; p [a952, v952]
b953 = +"abc"; w953 = b953.upcase!; r953 = [b953, w953]; p r953
