# frozen_string_literal: true
# Queue#pop
q001 = Queue.new
q001.push(1)
q001.push(2)
q001.push(3)
p q001.pop
v001 = q001.pop
p v001
p q001.pop
p q001.size

# pop on a closed, drained queue returns nil (never blocks)
q002 = Queue.new
q002.push(7)
q002.close
p q002.pop
p q002.pop

# deterministic producer/consumer: pop blocks until an item is available
q003 = Queue.new
prod001 = Thread.new do
  (1..100).each { |i001| q003.push(i001) }
  q003.close
end
cons001 = Thread.new do
  sum001 = 0
  while (x001 = q003.pop)
    sum001 += x001
  end
  sum001
end
prod001.join
p cons001.value
