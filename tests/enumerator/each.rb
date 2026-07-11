# frozen_string_literal: true
# Enumerator#each
e001 = [1, 2, 3].each; e001.each { |x| p x }
a004 = [10, 20].each_with_index; a004.each { |x, i| p [x, i] }
# each over a generator-backed enumerator
g061 = Enumerator.new { |y| y << 1; y << 2; y << 3 }; g061.each { |x| p x }
# each over a range enumerator
r061 = (1..3).each; r061.each { |x| p x }
# each returns the underlying receiver
b061 = [1, 2].each; v061 = b061.each { |x| }; p(v061)
# each over an each_slice enumerator (block receives each slice)
c061 = [1, 2, 3, 4, 5].each_slice(2); c061.each { |x| p x }
# a blockless #each inside a method body, and on a literal receiver in a block
def f902(a902); a902.each.to_a; end
p(f902([1, 2]))
[1, 2].each { |i903| p [i903].each.to_a }
# the same blockless #each on an Array that arrived as a BLOCK PARAMETER
# [[1, 2]].each { |a900| p a900.each.to_a }
# p([[1, 2], [3]].map { |a901| a901.each.to_a })
e904 = [1, 2].each; [e904].each { |x904| p x904.to_a }
# the return value of #each with a block: the object the underlying method returns
# BUG 20260904191912974 - answers the Enumerator instead of the Array
p([1, 2, 3].each_index.each { |i905| i905 })
# BUG 20260904191912974 - answers the Enumerator instead of the Array
v905 = [1, 2, 3].each_index.each { |i906| i906 }; p v905
# BUG 20260904191912974 - answers the pairs as an Array of Arrays instead of the Hash
p({a: 1}.each.each { |k907, v907| k907 })
# BUG 20260904191912974 - answers the pairs as an Array of Arrays instead of the Hash
v907 = {a: 1}.each.each { |k908, v908| k908 }; p v907
# BUG 20260904191826759 - the C build aborts on an each_with_index Enumerator over an Array
# p([1, 2, 3].each_with_index.each { |x909, i909| x909 })
# BUG 20260904191826759 - the C build aborts on an each_with_index Enumerator over an Array
# v909 = [1, 2, 3].each_with_index.each { |x910, i910| x910 }; p v909
# control: the iteration itself visits the right values in the right order
w905 = []; [1, 2, 3].each_index.each { |i911| w905 << i911 }; p w905
