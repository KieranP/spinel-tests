def mapping(fn)
  ->(step) { ->(acc, input) { step.call(acc, fn.call(input)) } }
end

conj = ->(acc, x) { acc + [x] }
r = mapping(->(n) { n * 3 }).call(conj)
p r.call([], 1)

# Secondary: a block converted to a proc by the method behaves the same.
# def mapping001(&fn)
#   ->(step) { ->(acc, input) { step.call(acc, fn.call(input)) } }
# end
# conj001 = ->(acc, x) { acc + [x] }
# r001 = mapping001 { |n| n * 3 }.call(conj001)
# p r001.call([], 1)

# Secondary: an Integer and a String accumulator raise the same way.
# add002 = ->(acc, x) { acc + x }
# r002 = mapping(->(n) { n * 3 }).call(add002)
# p r002.call(0, 1)
# cat003 = ->(acc, x) { acc + x.to_s }
# r003 = mapping(->(n) { n * 3 }).call(cat003)
# p r003.call("", 1)

# Secondary: the [] call syntax raises TypeError instead.
# def mapping004(fn)
#   ->(step) { ->(acc, input) { step[acc, fn[input]] } }
# end
# conj004 = ->(acc, x) { acc + [x] }
# r004 = mapping004(->(n) { n * 3 })[conj004]
# p r004[[], 1]

# Secondary: reached through a fold over a collection.
# conj005 = ->(acc, x) { acc + [x] }
# r005 = mapping(->(n) { n * 3 }).call(conj005)
# p [1, 2, 3].reduce([]) { |a005, i005| r005.call(a005, i005) }

# Controls that match: hoisting the inner call into a local, an inline transform with
# nothing closed over from the method, and the same two parameters taken by one lambda.
# def mapping006(fn)
#   ->(step) { ->(acc, input) { t006 = fn.call(input); step.call(acc, t006) } }
# end
# conj006 = ->(acc, x) { acc + [x] }
# r006 = mapping006(->(n) { n * 3 }).call(conj006)
# p r006.call([], 1)
# def mapping007
#   ->(step) { ->(acc, input) { step.call(acc, input * 3) } }
# end
# conj007 = ->(acc, x) { acc + [x] }
# r007 = mapping007.call(conj007)
# p r007.call([], 1)
# outer008 = ->(step, fn) { ->(acc, input) { step.call(acc, fn.call(input)) } }
# conj008 = ->(acc, x) { acc + [x] }
# r008 = outer008.call(conj008, ->(n) { n * 3 })
# p r008.call([], 1)
