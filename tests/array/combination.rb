# frozen_string_literal: true
# Array#combination

p([1, 2, 3].combination(2).to_a)

a001 = [1, 2, 3]
p a001.class
p a001.combination(2).to_a

a002 = [1, 2, 3]
b002 = 2
p b002.class
p a002.combination(b002).to_a

a003 = [1, 2, 3]
b003 = 2
c003 = a003.combination(b003).to_a
p c003.class
p c003

p([1.1, 2.2, 3.3].combination(2).to_a)

a004 = [1.1, 2.2, 3.3]
p a004.class
p a004.combination(2).to_a

a005 = [1.1, 2.2, 3.3]
b005 = 2
p b005.class
p a005.combination(b005).to_a

a006 = [1.1, 2.2, 3.3]
b006 = 2
c006 = a006.combination(b006).to_a
p c006.class
p c006

p(["a", "b", "c"].combination(2).to_a)

a007 = ["a", "b", "c"]
p a007.class
p a007.combination(2).to_a

a008 = ["a", "b", "c"]
b008 = 2
p b008.class
p a008.combination(b008).to_a

a009 = ["a", "b", "c"]
b009 = 2
c009 = a009.combination(b009).to_a
p c009.class
p c009

# A combination(2).select{}.map{} chain on a destructured block parameter emits ill-typed C.
# Kept commented: a compile abort takes down the whole file.
h960 = { "a" => [1, 2, 3] }
p(h960.flat_map { |k960, r960| r960.combination(2).select { |x960, y960| x960 < y960 }.map { |x961, y961| x961 + y961 } })
v960 = h960.flat_map { |k962, r962| r962.combination(2).select { |x962, y962| x962 < y962 }.map { |x963, y963| x963 + y963 } }; p v960

# A blockless combination on an Array bound from a Hash-iteration block parameter is untyped.
h990 = { "a" => [1, 2, 3] }
r990 = (h990.map { |k990, own990| own990.combination(2).to_a.size } rescue $!.class); p r990

# blockless combination is an Enumerator in CRuby
p([1, 2, 3].combination(2).class)
h041 = [1, 2, 3]; w041 = h041.combination(2); p w041.class
p([1, 2, 3, 4].combination(2).to_a)
w042 = [1, 2, 3, 4].combination(2).to_a; p w042
p([1, 2, 3].combination(0).to_a)
p([1, 2, 3].combination(3).to_a)
p([1, 2, 3].combination(5).to_a)
p([].combination(0).to_a)
p([7].combination(1).to_a)
p(%w[a b c].combination(2).to_a)
p([1, 2, 3].combination(2) { |c043| p c043 })
w044 = ([1, 2].combination(-1).to_a rescue $!.class); p w044
