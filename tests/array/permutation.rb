# frozen_string_literal: true
# Array#permutation

p([1, 2, 3].permutation(2).to_a)

a001 = [1, 2, 3]
p a001.class
p a001.permutation(2).to_a

a002 = [1, 2, 3]
b002 = 2
p b002.class
p a002.permutation(b002).to_a

a003 = [1, 2, 3]
b003 = 2
c003 = a003.permutation(b003).to_a
p c003.class
p c003

p([1.1, 2.2, 3.3].permutation(2).to_a)

a004 = [1.1, 2.2, 3.3]
p a004.class
p a004.permutation(2).to_a

a005 = [1.1, 2.2, 3.3]
b005 = 2
p b005.class
p a005.permutation(b005).to_a

a006 = [1.1, 2.2, 3.3]
b006 = 2
c006 = a006.permutation(b006).to_a
p c006.class
p c006

p(["a", "b", "c"].permutation(2).to_a)

a007 = ["a", "b", "c"]
p a007.class
p a007.permutation(2).to_a

a008 = ["a", "b", "c"]
b008 = 2
p b008.class
p a008.permutation(b008).to_a

a009 = ["a", "b", "c"]
b009 = 2
c009 = a009.permutation(b009).to_a
p c009.class
p c009

# blockless permutation is an Enumerator in CRuby
p([1, 2, 3].permutation(2).class)
h051 = [1, 2, 3]; w051 = h051.permutation(2); p w051.class
p([1, 2, 3].permutation(2).to_a)
w052 = [1, 2, 3].permutation(2).to_a; p w052
p([1, 2, 3].permutation.to_a)
p([1, 2, 3].permutation(0).to_a)
p([1, 2, 3].permutation(5).to_a)
p([].permutation(0).to_a)
p(%w[a b].permutation(2).to_a)
p([1, 2].permutation(2) { |c053| p c053 })
