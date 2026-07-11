# frozen_string_literal: true
# Enumerator#compact / Enumerator::Lazy#compact
p([1, nil, 2, nil, 3].each.compact)
v001 = [1, nil, 2, nil, 3].each.compact; p(v001)
p([1, nil, 2].lazy.compact.to_a)
v002 = [1, nil, 2].lazy.compact.to_a; p(v002)
