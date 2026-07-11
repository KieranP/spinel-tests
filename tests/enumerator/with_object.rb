# frozen_string_literal: true
# Enumerator#with_object
p([1, 2, 3].each.with_object([]) { |x, acc| acc << x * 2 })
v014 = [1, 2, 3].each.with_object([]) { |x, acc| acc << x * 2 }; p(v014)
a007 = [1, 2, 3]; p(a007.each.with_object([]) { |x, acc| acc << x + 1 })
e009 = [1, 2, 3].each; p(e009.with_object([]) { |x, acc| acc << x })
# with_object accumulating into a hash
p([1, 2, 3].each.with_object({}) { |x, h| h[x] = x * x })
b058 = [1, 2, 3].each; v058 = b058.with_object({}) { |x, h| h[x] = x * x }; p(v058)
# with_object returns the memo object itself (same identity)
c058 = [1, 2].each; acc058 = []; r058 = c058.with_object(acc058) { |x, a| a << x }; p(r058.equal?(acc058))
# with_object accumulating into a string (the memo must be mutable; a literal is frozen)
d058 = [1, 2, 3].each; p(d058.with_object(+"") { |x, s| s << x.to_s })
d059 = [1, 2, 3].each; v059 = d059.with_object(+"") { |x, s| s << x.to_s }; p(v059)
# with_object with no block returns an Enumerator
f058 = [1, 2, 3].each.with_object([]); p(f058.class)
[1, 2].each.with_object([]).each { |x, acc| acc << x; p acc }
# with_object over an infinite lazy source
# p((1..Float::INFINITY).lazy.map { |x900| x900 * 2 }.with_object(0).first(1))   # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
