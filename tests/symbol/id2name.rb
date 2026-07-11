# frozen_string_literal: true
# Symbol#id2name
p(:hello.id2name)
v001 = (:hello.id2name); p v001
a001 = :hello; p(a001.id2name)
a002 = :hello; c002 = (a002.id2name); p c002
p(:"a b".id2name)
v002 = (:"a b".id2name); p v002
