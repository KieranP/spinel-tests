# frozen_string_literal: true
# Symbol#to_sym
p(:hello.to_sym)
v001 = (:hello.to_sym); p v001
p(:hello.to_sym.equal?(:hello))
v002 = (:hello.to_sym.equal?(:hello)); p v002
a001 = :hello; p(a001.to_sym)
a002 = :hello; c002 = (a002.to_sym); p c002
