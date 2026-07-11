# frozen_string_literal: true
# Array#cycle
p([1, 2, 3].cycle.first(7))

a001 = [1, 2, 3]
p a001.class
p a001.cycle.first(7)

a002 = [1, 2, 3]
c002 = a002.cycle.first(7)
p c002.class
p c002

p([1.1, 2.2, 3.3].cycle.first(7))

a003 = [1.1, 2.2, 3.3]
p a003.class
p a003.cycle.first(7)

a004 = [1.1, 2.2, 3.3]
c004 = a004.cycle.first(7)
p c004.class
p c004

p(["a", "b", "c"].cycle.first(7))

a005 = ["a", "b", "c"]
p a005.class
p a005.cycle.first(7)

a006 = ["a", "b", "c"]
c006 = a006.cycle.first(7)
p c006.class
p c006

x098 = [1, 2, 3].cycle(2) { |y| }; p x098

# the counted form, zero cycles, and the blockless Enumerator
p([1, 2, 3].cycle(2).to_a)
w391 = [1, 2, 3].cycle(2).to_a; p w391
p([1, 2, 3].cycle(0).to_a)
p([1, 2].cycle(3).to_a)
p([1, 2, 3].cycle(2).class)
p([].cycle(2).to_a)
p(%w[a b].cycle(2).to_a)
w392 = %w[a b].cycle(2).to_a; p w392
p([1, 2].cycle(1) { |x393| p x393 })
w394 = ([1, 2].cycle(-1).to_a rescue $!.class); p w394
a411 = []
p a411.cycle(2).to_a
v411 = a411.cycle(2).to_a; p v411
p a411.cycle(2).class

# the block form on an EMPTY literal receiver (kept commented: the reject aborts the file)
p([].cycle(2) { |x412| p x412 })
w412 = [].cycle { |x413| p x413 }; p w412
