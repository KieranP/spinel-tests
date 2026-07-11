# frozen_string_literal: true
# Symbol#match
p(:hello.match(/l(l)o/)[1])
v010 = (:hello.match(/l(l)o/)[1]); p v010
p(:hello.match(/l(l)o/)[0])
v011 = (:hello.match(/l(l)o/)[0]); p v011
p(:hello.match(/z/))
v012 = (:hello.match(/z/)); p v012
a001 = :hello; p(a001.match(/l(l)o/)[1])
a002 = :hello; b002 = /l(l)o/; c002 = (a002.match(b002)[1]); p c002
