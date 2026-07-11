# frozen_string_literal: true
# Enumerator#peek
e005 = [1, 2, 3].each; p(e005.next); p(e005.peek); p(e005.next)
# peek does not advance the position (two peeks in a row give the same value)
a056 = [1, 2, 3].each; p(a056.peek); p(a056.peek); p(a056.next)
# peek captured in a variable
b056 = [10, 20].each; v056 = b056.peek; p(v056)
# peek past the end raises StopIteration
c056 = [1].each; c056.next; begin; c056.peek; rescue StopIteration; p(:stop); end
# peek interleaved with next on a generator
g900 = Enumerator.new { |y| y << 1; y << 2; y << 3 }; p(g900.next); p(g900.peek); p(g900.next)
# peek past the end of a generator, rescue-wrapped
g901 = Enumerator.new { |y| y << 1 }; g901.next; r901 = (g901.peek rescue $!.class); p(r901)
