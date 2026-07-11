# frozen_string_literal: true
# Queue#enq (alias of #push)
q001 = Queue.new
p(q001.enq(10).size)
q001.enq(20)
p q001.size
p q001.pop
p q001.pop

q002 = Queue.new
v001 = q002.enq(99)
p v001.size
p v001.pop

# enq after close raises ClosedQueueError
q003 = Queue.new
q003.close
r001 = (q003.enq(1) rescue $!.class)
p r001
