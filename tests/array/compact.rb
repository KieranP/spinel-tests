# frozen_string_literal: true
# Array#compact
p([1, nil, 2, nil].compact)

a001 = [1, nil, 2, nil]
p a001.class
p a001.compact

a002 = [1, nil, 2, nil]
c002 = a002.compact
p c002.class
p c002

p([1.1, nil, 2.2, nil].compact)

a003 = [1.1, nil, 2.2, nil]
p a003.class
p a003.compact

a004 = [1.1, nil, 2.2, nil]
c004 = a004.compact
p c004.class
p c004

p(["a", nil, "b", nil].compact)

a005 = ["a", nil, "b", nil]
p a005.class
p a005.compact

a006 = ["a", nil, "b", nil]
c006 = a006.compact
p c006.class
p c006

# no nils -> copy unchanged
p([1, 2, 3].compact)
a100 = [1, 2, 3]
p a100.compact
a101 = [1, 2, 3]
c101 = a101.compact
p c101

# all nils -> []
p([nil, nil].compact)
a102 = [nil, nil]
p a102.compact
a103 = [nil, nil]
c103 = a103.compact
p c103

# empty
p([].compact)
a104 = []
p a104.compact
a105 = []
c105 = a105.compact
p c105

# nested arrays with nils (compact is shallow)
p([[1, nil], nil, [2]].compact)
a106 = [[1, nil], nil, [2]]
p a106.compact
a107 = [[1, nil], nil, [2]]
c107 = a107.compact
p c107

# leading/trailing nils
p([nil, 1, 2, nil].compact)
a108 = [nil, 1, 2, nil]
p a108.compact
a109 = [nil, 1, 2, nil]
c109 = a109.compact
p c109

# A value returned from a method with a `raise` branch loses much of its method
# table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_ac(oac)
  case oac
  when Integer then [1, 2, 3]
  when String  then [4, 5, 6]
  else raise ArgumentError, "no"
  end
end
rb_ac = (raisebr_ac("ab").compact rescue $!.class); p rb_ac

# `compact` on an Array reached through an enclosing container raises NoMethodError.
hc01 = { 0 => [1, nil, 2] }; hr01 = (hc01[0].compact rescue $!.class); p hr01
hc02 = [[1, nil, 2]]; hr02 = (hc02[0].compact rescue $!.class); p hr02
hc03 = { 0 => [1, nil, 2] }; hr03 = (hc03.fetch(0).compact rescue $!.class); p hr03

# compact drops the nil that String#rindex returns on a miss.
n702 = "a".rindex("/")
p([n702, 1].compact)
v702 = [n702, 1].compact; p v702

# compact does not drop the nil produced by a short-circuiting &&.
n705 = "a".rindex("/") && "a".upcase
p([n705, "z"].compact)
v705 = [n705, "z"].compact; p v705
