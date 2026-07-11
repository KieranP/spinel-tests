p([1, 2, 3].each_index.each { |i| i })
p({a: 1}.each.each { |k, v| k })
p([1, 2, 3].each_slice(2).each { |x| x })
p([1, 2, 3].each_with_object([]).each { |x, m| m << x })

# Secondary: capturing the result answers the same wrong object.
# v001 = [1, 2, 3].each_index.each { |i| i }; p v001
# v002 = {a: 1}.each.each { |k, v| k }; p v002

# Secondary: a Hash through each_with_index answers the Enumerator.
# p({a: 1}.each_with_index.each { |pr, i| i })

# Control: the iteration itself visits the right values in the right order.
# w001 = []; [1, 2, 3].each_index.each { |i| w001 << i }; p w001
# w002 = []; {a: 1, b: 2}.each.each { |k, v| w002 << k }; p w002
# w003 = []; [1, 2, 3].each_slice(2).each { |x| w003 << x }; p w003

# Controls that match: each on the plain each Enumerator, and on each_entry.
# p([1, 2, 3].each.each { |x| x })
# p([1, 2, 3].each_entry.each { |x| x })
