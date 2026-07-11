# frozen_string_literal: true
# Queue#<<
q001 = Queue.new
p((q001 << 10).size)
q001 << 20
p q001.size
p q001.pop
p q001.pop

q002 = Queue.new
v001 = (q002 << 99)
p v001.size
p v001.pop

# << after close raises ClosedQueueError
q003 = Queue.new
q003.close
r001 = (q003 << 1 rescue $!.class)
p r001
