# frozen_string_literal: true
# Kernel#then
a012 = Object.new; p(a012.then { |o| o.equal?(a012) })
a013 = Object.new; v013 = a013.then { |o| o.equal?(a013) }; p v013
p(5.then { |x| x + 1 })
v014 = 5.then { |x| x.to_s }; p v014
p("ab".then { |s| s.upcase })
p([1, 2].then { |a| a.size })
p({ a: 1 }.then { |h| h.keys })
p(nil.then { |x| x.inspect })
p(1.5.then { |f| f * 2 })
p(3.then { _1 * 3 })
v015 = :s.then { |x| x.to_s }; p v015

# Blockless #then answers an Enumerator over an arbitrary method; Spinel raises NoMethodError.
# WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# p(5.then.class)
