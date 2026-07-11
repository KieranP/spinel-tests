# frozen_string_literal: true
# Array#reverse_each
p([1, 2, 3].reverse_each.to_a)

a001 = [1, 2, 3]
p a001.class
p a001.reverse_each.to_a

a002 = [1, 2, 3]
c002 = a002.reverse_each.to_a
p c002.class
p c002

p([1.1, 2.2, 3.3].reverse_each.to_a)

a003 = [1.1, 2.2, 3.3]
p a003.class
p a003.reverse_each.to_a

a004 = [1.1, 2.2, 3.3]
c004 = a004.reverse_each.to_a
p c004.class
p c004

p(["a", "b", "c"].reverse_each.to_a)

a005 = ["a", "b", "c"]
p a005.class
p a005.reverse_each.to_a

a006 = ["a", "b", "c"]
c006 = a006.reverse_each.to_a
p c006.class
p c006

# As a method's implicit return value this yields a zero value of the receiver's
# type instead of the receiver itself.
def ir807(x807); x807.reverse_each { |e807| nil }; end
p ir807([1, 2])
v807 = ir807([1, 2]); p v807
# control: the same call with the result consumed explicitly
def ic807(y807); return y807.reverse_each { |e807| nil }; end
p ic807([1, 2])
