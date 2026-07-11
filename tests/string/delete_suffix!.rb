# frozen_string_literal: true
# String#delete_suffix!
p((+"hello").delete_suffix!("llo"))
a01 = +"hello"; a01.delete_suffix!("llo"); p a01
a02 = +"hello"; b02 = +"llo"; a02.delete_suffix!(b02); p a02
a03 = +"hello"; b03 = +"llo"; c03 = (a03.delete_suffix!(b03)); p c03
# suffix not present returns nil (no change)
p((+"hello").delete_suffix!("xyz"))
a04 = +"hello"; c04 = (a04.delete_suffix!("xyz")); p c04
