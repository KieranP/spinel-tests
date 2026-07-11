# frozen_string_literal: true
# String#tr_s!
p((+"hello").tr_s!("l", "r"))
a01 = +"hello"; a01.tr_s!("l", "r"); p a01
a02 = +"aabbcc"; b02 = +"a-c"; a02.tr_s!(b02, "x"); p a02
a03 = +"aabbcc"; b03 = +"a-c"; c03 = (a03.tr_s!(b03, "x")); p c03
# no matching chars returns nil (no change)
p((+"hello").tr_s!("xyz", "abc"))
a04 = +"hello"; c04 = (a04.tr_s!("xyz", "abc")); p c04
