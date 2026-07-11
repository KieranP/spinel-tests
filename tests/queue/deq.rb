# frozen_string_literal: true
# Queue#deq (alias of #pop)
q001 = Queue.new
q001.push(1)
q001.push(2)
q001.push(3)
p q001.deq
v001 = q001.deq
p v001
p q001.deq
p q001.size

# deq on a closed, drained queue returns nil (never blocks)
q002 = Queue.new
q002.push(7)
q002.close
p q002.deq
p q002.deq

# deterministic producer/consumer via deq
q003 = Queue.new
prod001 = Thread.new do
  (1..50).each { |i001| q003.enq(i001) }
  q003.close
end
cons001 = Thread.new do
  sum001 = 0
  while (x001 = q003.deq)
    sum001 += x001
  end
  sum001
end
prod001.join
p cons001.value
