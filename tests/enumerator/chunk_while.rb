# frozen_string_literal: true
# Enumerator#chunk_while / Enumerator::Lazy#chunk_while
# eager form on an external Enumerator works:
p([1, 2, 4, 5, 7].each.chunk_while { |a, b| b - a == 1 }.to_a)
v001 = [1, 2, 4, 5, 7].each.chunk_while { |a, b| b - a == 1 }.to_a; p(v001)
a001 = [1, 2, 3, 10, 11]; p(a001.each.chunk_while { |x, y| y - x == 1 }.to_a)
b001 = [4, 5, 6].each; v002 = b001.chunk_while { |x, y| y == x + 1 }.to_a; p(v002)
p([1, 2, 4, 5, 7].lazy.chunk_while { |a, b| b - a == 1 }.to_a)
v003 = [1, 2, 4, 5, 7].lazy.chunk_while { |a, b| b - a == 1 }.to_a; p(v003)
