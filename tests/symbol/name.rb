# frozen_string_literal: true
# Symbol#name
p(:hello.name)
v001 = (:hello.name); p v001
a001 = :hello; p(a001.name)
a002 = :hello; c002 = (a002.name); p c002
p(:hello.name.frozen?)
v002 = (:hello.name.frozen?); p v002

# Symbol.name
p(Symbol.name)
v043 = Symbol.name; p v043
