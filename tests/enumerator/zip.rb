# frozen_string_literal: true
# Enumerator#zip / Enumerator::Lazy#zip
p([1, 2, 3].each.zip([4, 5, 6]))
v001 = [1, 2, 3].each.zip([4, 5, 6]); p(v001)
p([1, 2, 3].lazy.zip([4, 5, 6]).to_a)
v002 = [1, 2, 3].lazy.zip([4, 5, 6]).to_a; p(v002)
p([1, 2, 3].each.zip([4, 5, 6], [7, 8, 9]))
v003 = [1, 2, 3].each.zip([4, 5, 6], [7, 8, 9]); p(v003)
p([1, 2, 3].lazy.zip([4, 5, 6], [7, 8, 9]).to_a)
# zip over an infinite lazy source
# p((1..Float::INFINITY).lazy.zip([10, 20, 30]).first(3))   # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
