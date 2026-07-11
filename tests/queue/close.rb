# frozen_string_literal: true
# Queue#close
q001 = Queue.new
q001.push(1)
q001.push(2)
p q001.close.closed?
p q001.pop
p q001.pop
p q001.pop

q002 = Queue.new
v001 = q002.close
p v001.closed?

# closing an already-closed queue is a no-op (returns self)
q003 = Queue.new
q003.close
p q003.close.closed?
