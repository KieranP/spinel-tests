# frozen_string_literal: true
# Hash#chain
p({ a: 1 }.chain({ b: 2 }).to_a)
a002 = { a: 1 }; p(a002.chain({ b: 2 }).to_a)
a003 = { a: 1 }; b003 = [[:b, 2]]; c003 = (a003.chain(b003).to_a); p c003
a004 = {}; c004 = (a004.chain([[:x, 9]]).to_a); p c004
