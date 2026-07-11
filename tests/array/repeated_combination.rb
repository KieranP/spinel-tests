# frozen_string_literal: true
# Array#repeated_combination

p([1, 2, 3].repeated_combination(2).to_a)

a001 = [1, 2, 3]
p a001.class
p a001.repeated_combination(2).to_a

a002 = [1, 2, 3]
b002 = 2
p b002.class
p a002.repeated_combination(b002).to_a

a003 = [1, 2, 3]
b003 = 2
c003 = a003.repeated_combination(b003).to_a
p c003.class
p c003

p([1.1, 2.2, 3.3].repeated_combination(2).to_a)

a004 = [1.1, 2.2, 3.3]
p a004.class
p a004.repeated_combination(2).to_a

a005 = [1.1, 2.2, 3.3]
b005 = 2
p b005.class
p a005.repeated_combination(b005).to_a

a006 = [1.1, 2.2, 3.3]
b006 = 2
c006 = a006.repeated_combination(b006).to_a
p c006.class
p c006

p(["a", "b", "c"].repeated_combination(2).to_a)

a007 = ["a", "b", "c"]
p a007.class
p a007.repeated_combination(2).to_a

a008 = ["a", "b", "c"]
b008 = 2
p b008.class
p a008.repeated_combination(b008).to_a

a009 = ["a", "b", "c"]
b009 = 2
c009 = a009.repeated_combination(b009).to_a
p c009.class
p c009

# blockless repeated_combination is an Enumerator in CRuby
p([1, 2].repeated_combination(2).class)
h061 = [1, 2]; w061 = h061.repeated_combination(2); p w061.class
p([1, 2].repeated_combination(0).to_a)
p([1, 2].repeated_combination(2).to_a)
p([1, 2].repeated_combination(3).to_a)
w062 = [1, 2].repeated_combination(2).to_a; p w062
p(%w[a b].repeated_combination(2).to_a)
