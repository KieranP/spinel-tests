# frozen_string_literal: true
# Queue#clear
q001 = Queue.new
q001.push(1)
q001.push(2)
q001.push(3)
p q001.clear.size
p q001.empty?

q002 = Queue.new
q002.push(9)
v001 = q002.clear
p v001.size

# clear on an already-empty queue
q003 = Queue.new
p q003.clear.size
