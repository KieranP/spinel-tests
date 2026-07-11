# frozen_string_literal: true
# Array#each_index

p([10, 20, 30].each_index.to_a)

a001 = [10, 20, 30]
p a001.class
p a001.each_index.to_a

a002 = [10, 20, 30]
c002 = a002.each_index.to_a
p c002.class
p c002

p([1.5, 2.5, 3.5, 4.5].each_index.to_a)

a003 = [1.5, 2.5, 3.5, 4.5]
p a003.class
p a003.each_index.to_a

a004 = [1.5, 2.5, 3.5, 4.5]
c004 = a004.each_index.to_a
p c004.class
p c004

p(["a", "b"].each_index.to_a)

a005 = ["a", "b"]
p a005.class
p a005.each_index.to_a

a006 = ["a", "b"]
c006 = a006.each_index.to_a
p c006.class
p c006

r550b = ([[1, 2], [3, 4]].map { |row550| n550 = 0; row550.each_index { |_i550| n550 += 1 }; n550 } rescue $!.class); p r550b
p([10, 20, 30].each_index.sum { |i841| i841 })

r616 = ([[1, 2]].map { |row616| row616.each_index.map { |c616| c616 } } rescue $!.class); p r616
a616 = [1, 2]; p(a616.each_index.map { |c616b| c616b })

# reverse_each over the returned Enumerator
p([1, 2, 3].each_index.reverse_each { |i638| i638 })
w638 = []; [1, 2, 3].each_index.reverse_each { |i639| w638 << i639 }; p w638
# the return value of #each with a block on the returned Enumerator
# BUG 20260904191912974 - answers the Enumerator instead of the Array
p([1, 2, 3].each_index.each { |i905| i905 })
# BUG 20260904191912974 - answers the Enumerator instead of the Array
v905 = [1, 2, 3].each_index.each { |i906| i906 }; p v905
