# frozen_string_literal: true
# Symbol#succ
p(:az.succ)
a022 = :az; p(a022.succ)
a023 = :az; c023 = (a023.succ); p c023
p(:"a9".succ)
v020 = (:"a9".succ); p v020
p([:az].map(&:succ))
v021 = ([:az].map(&:succ)); p v021
# Symbol Range enumeration walks via succ
p((:a..:e).to_a)
v024 = ((:a..:c).map(&:to_s)); p v024
