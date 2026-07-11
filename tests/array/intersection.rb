# frozen_string_literal: true
# Array#intersection
p([1, 2, 3].intersection([2, 3, 4]))

a030 = [1, 2, 3]
p a030.class
p a030.intersection([2, 3, 4])

a031 = [1, 2, 3]
b031 = [2, 3, 4]
p b031.class
p a031.intersection(b031)

a032 = [1, 2, 3]
b032 = [2, 3, 4]
c032 = a032.intersection(b032)
p c032.class
p c032

p([1.1, 2.2, 3.3].intersection([2.2, 3.3, 4.4]))

a033 = [1.1, 2.2, 3.3]
p a033.class
p a033.intersection([2.2, 3.3, 4.4])

a034 = [1.1, 2.2, 3.3]
b034 = [2.2, 3.3, 4.4]
p b034.class
p a034.intersection(b034)

a035 = [1.1, 2.2, 3.3]
b035 = [2.2, 3.3, 4.4]
c035 = a035.intersection(b035)
p c035.class
p c035

p(["a", "b", "c"].intersection(["b", "c", "d"]))

a036 = ["a", "b", "c"]
p a036.class
p a036.intersection(["b", "c", "d"])

a037 = ["a", "b", "c"]
b037 = ["b", "c", "d"]
p b037.class
p a037.intersection(b037)

a038 = ["a", "b", "c"]
b038 = ["b", "c", "d"]
c038 = a038.intersection(b038)
p c038.class
p c038

# one, several and zero other arrays
h001 = [1, 2, 3, 4]
p h001.intersection([2, 3])
w001 = h001.intersection([2, 3]); p w001
p h001.intersection([2, 3], [3])
w002 = h001.intersection([2, 3], [3]); p w002
p h001.intersection([])
p h001.intersection([9])
p([].intersection([1]))
p(%w[a b c].intersection(%w[b c]))
w003 = %w[a b c].intersection(%w[b c]); p w003
p h001.intersection
w004 = h001.intersection; p w004
