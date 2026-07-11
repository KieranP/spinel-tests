# frozen_string_literal: true
# Symbol#next
p(:az.next)
v001 = (:az.next); p v001
p(:zz.next)
v002 = (:zz.next); p v002
a001 = :az; p(a001.next)
a002 = :az; c002 = (a002.next); p c002
p([:az].map(&:next))
v003 = ([:az].map(&:next)); p v003
