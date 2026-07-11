# frozen_string_literal: true
# Symbol#intern
p(:hello.intern)
v001 = (:hello.intern); p v001
a001 = :hello; p(a001.intern)
a002 = :hello; c002 = (a002.intern); p c002
