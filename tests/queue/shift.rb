# frozen_string_literal: true
# Queue#shift
q001 = Queue.new
q001.push(1)
q001.push(2)
q001.push(3)
p q001.shift
v001 = q001.shift
p v001
p q001.shift
p q001.size

# shift on a closed, drained queue returns nil (never blocks)
q002 = Queue.new
q002.push(7)
q002.close
p q002.shift
p q002.shift
