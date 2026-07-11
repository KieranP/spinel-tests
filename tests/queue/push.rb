# frozen_string_literal: true
# Queue#push
q001 = Queue.new
p(q001.push(10).size)
q001.push(20)
p q001.size
p q001.pop
p q001.pop

q002 = Queue.new
v001 = q002.push(99)
p v001.size
p v001.pop

# push after close raises ClosedQueueError
q003 = Queue.new
q003.close
r001 = (q003.push(1) rescue $!.class)
p r001
