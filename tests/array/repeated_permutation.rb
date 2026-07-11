# frozen_string_literal: true
# Array#repeated_permutation

p([1, 2].repeated_permutation(2).to_a)

a001 = [1, 2]
p a001.class
p a001.repeated_permutation(2).to_a

a002 = [1, 2]
b002 = 2
p b002.class
p a002.repeated_permutation(b002).to_a

a003 = [1, 2]
b003 = 2
c003 = a003.repeated_permutation(b003).to_a
p c003.class
p c003

p([1.1, 2.2].repeated_permutation(2).to_a)

a004 = [1.1, 2.2]
p a004.class
p a004.repeated_permutation(2).to_a

a005 = [1.1, 2.2]
b005 = 2
p b005.class
p a005.repeated_permutation(b005).to_a

a006 = [1.1, 2.2]
b006 = 2
c006 = a006.repeated_permutation(b006).to_a
p c006.class
p c006

p(["a", "b"].repeated_permutation(2).to_a)

a007 = ["a", "b"]
p a007.class
p a007.repeated_permutation(2).to_a

a008 = ["a", "b"]
b008 = 2
p b008.class
p a008.repeated_permutation(b008).to_a

a009 = ["a", "b"]
b009 = 2
c009 = a009.repeated_permutation(b009).to_a
p c009.class
p c009

# every length, including 0 and one beyond the receiver's size
p([1, 2].repeated_permutation(0).to_a)
p([1, 2].repeated_permutation(2).to_a)
p([1, 2].repeated_permutation(3).to_a)
w471 = [1, 2].repeated_permutation(2).to_a; p w471
p(%w[a b].repeated_permutation(2).to_a)
w472 = %w[a b].repeated_permutation(2).to_a; p w472
p([7].repeated_permutation(2).to_a)
