# frozen_string_literal: true
# Enumerator#next
e004 = [1, 2, 3].each; p(e004.next); p(e004.next)
a005 = Enumerator.new { |y| y << 7; y << 8 }; p(a005.next)
v008 = [1, 2, 3].each; p(v008.next)
# consecutive nexts captured into variables
b055 = [10, 20].each; x055 = b055.next; y055 = b055.next; p([x055, y055])
# next past the end raises StopIteration
c055 = [1].each; c055.next; begin; c055.next; rescue StopIteration; p(:stop); end
# next on an infinite generator
g055 = Enumerator.new { |y| i = 0; loop { y << (i += 1) } }; p(g055.next); p(g055.next)
# loop stops on StopIteration (the idiomatic external-iteration form)
d055 = [1, 2, 3].each; loop { p d055.next }
e055 = Enumerator.new { |y| y << 1; y << 2 }; loop { p e055.next }
r056 = ((1..).each.next rescue $!.class); p r056
# next on the enumerators other blockless builtins hand back
p("abc".each_char.next)
p([1, 2, 3].each_slice(2).next)
p([1, 2].each_with_index.next)
p([1, 2, 3].map.next)
p({ a: 1, b: 2 }.each.next)
p([1, 2].each.with_index.next)
p([1, 2, 3].to_enum(:each).next)
# when the enumerator is exhausted, loop's value is the enumerator's own result
e100 = [1, 2].each; r100 = loop { e100.next }; p(r100)
e101 = (1..3).each; r101 = loop { e101.next }; p(r101)
# p(5.times.next)         # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# p(1.step(10, 3).next)   # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
