# frozen_string_literal: true
# String#delete_prefix!
p((+"hello").delete_prefix!("hel"))
a01 = +"hello"; a01.delete_prefix!("hel"); p a01
a02 = +"hello"; b02 = +"hel"; a02.delete_prefix!(b02); p a02
a03 = +"hello"; b03 = +"hel"; c03 = (a03.delete_prefix!(b03)); p c03
# prefix not present returns nil (no change)
p((+"hello").delete_prefix!("xyz"))
a04 = +"hello"; c04 = (a04.delete_prefix!("xyz")); p c04
