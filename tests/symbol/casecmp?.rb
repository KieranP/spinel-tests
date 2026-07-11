# frozen_string_literal: true
# Symbol#casecmp?
p(:HELLO.casecmp?(:hello))
v001 = (:HELLO.casecmp?(:hello)); p v001
p(:HELLO.casecmp?(:world))
v002 = (:HELLO.casecmp?(:world)); p v002
a001 = :HELLO; p(a001.casecmp?(:hello))
v003 = (a001.casecmp?(:hello)); p v003
a002 = :HELLO; b002 = :hello; c002 = (a002.casecmp?(b002)); p c002
p(:HELLO.casecmp?("hello"))
v004 = (:HELLO.casecmp?("hello")); p v004
