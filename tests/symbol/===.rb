# frozen_string_literal: true
# Symbol#===
p(:foo === :foo)
v001 = (:foo === :foo); p v001
p(:foo === :bar)
v002 = (:foo === :bar); p v002
p(:foo === "foo")
v003 = (:foo === "foo"); p v003
a001 = :foo; p(a001 === :foo)
v004 = (a001 === :foo); p v004
a002 = :foo; b002 = :bar; p(a002 === b002)
v005 = (a002 === b002); p v005
