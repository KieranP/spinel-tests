# frozen_string_literal: true
# Array#equal?
a131 = [1, 2]; b131 = a131; p a131.equal?(b131)

# Kernel#equal? — identity, not equality
a132 = [1, 2]; b132 = [1, 2]; p(a132.equal?(b132))
h133 = { a: 1 }; i133 = h133; p(h133.equal?(i133))
h134 = { a: 1 }; i134 = { a: 1 }; p(h134.equal?(i134))
o135 = Object.new; p(o135.equal?(o135))
o136 = Object.new; o137 = Object.new; p(o136.equal?(o137))
p(1.equal?(1))
p(:s.equal?(:s))
p(nil.equal?(nil))
p(true.equal?(true))
s138 = +"ab"; t138 = s138; p(s138.equal?(t138))
s139 = +"ab"; t139 = +"ab"; p(s139.equal?(t139))
v140 = [1, 2]; w140 = v140; x140 = v140.equal?(w140); p x140
