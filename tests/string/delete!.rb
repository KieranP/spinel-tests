# frozen_string_literal: true
# String#delete!
p((+"hello").delete!("l"))
a01 = +"hello"; a01.delete!("l"); p a01
a02 = +"hello"; b02 = +"l"; a02.delete!(b02); p a02
a03 = +"hello"; b03 = +"l"; c03 = (a03.delete!(b03)); p c03
# ranges and negation
a04 = +"hello world"; a04.delete!("a-y"); p a04
a05 = +"hello"; a05.delete!("^l"); p a05
# no matching chars returns nil (no change)
p((+"hello").delete!("z"))
a06 = +"hello"; c06 = (a06.delete!("z")); p c06
