# frozen_string_literal: true
# String#tr!
p((+"hello").tr!("el", "ip"))
a01 = +"hello"; a01.tr!("el", "ip"); p a01
a02 = +"hello"; b02 = +"el"; a02.tr!(b02, "ip"); p a02
a03 = +"hello"; b03 = +"el"; c03 = (a03.tr!(b03, "ip")); p c03
# ranges and negation
a04 = +"hello"; a04.tr!("a-y", "b-z"); p a04
a05 = +"hello"; a05.tr!("^aeiou", "*"); p a05
# no matching chars returns nil (no change)
p((+"hello").tr!("xyz", "abc"))
a06 = +"hello"; c06 = (a06.tr!("xyz", "abc")); p c06
