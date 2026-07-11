# frozen_string_literal: true
# Symbol#casecmp
p(:HELLO.casecmp(:hello))
v001 = (:HELLO.casecmp(:hello)); p v001
p(:abc.casecmp(:abd))
v002 = (:abc.casecmp(:abd)); p v002
p(:abd.casecmp(:abc))
v003 = (:abd.casecmp(:abc)); p v003
a001 = :HELLO; p(a001.casecmp(:hello))
v004 = (a001.casecmp(:hello)); p v004
a002 = :HELLO; b002 = :world; c002 = (a002.casecmp(b002)); p c002
p(:HELLO.casecmp("hello"))
v005 = (:HELLO.casecmp("hello")); p v005
