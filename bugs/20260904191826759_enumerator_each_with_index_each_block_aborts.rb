p([1, 2, 3].each_with_index.each { |x, i| x })

# Secondary: capturing the result aborts the same way.
# v001 = [1, 2, 3].each_with_index.each { |x, i| x }; p v001

# Secondary: an Array of Strings aborts on sp_StrArray * instead.
# p(["a", "b"].each_with_index.each { |x, i| x })

# Controls that compile: a Hash receiver, and each on the plain each Enumerator.
# p({a: 1}.each_with_index.each { |pr, i| i })
# p([1, 2, 3].each.each { |x| x })
