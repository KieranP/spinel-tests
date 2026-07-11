# frozen_string_literal: true
# Queue#length (alias of #size)
q001 = Queue.new
p q001.length
q001.push(1)
q001.push(2)
p q001.length
q001.pop
p q001.length
v001 = q001.length
p v001

q002 = Queue.new
q002.push(1)
q002.push(2)
q002.push(3)
p(q002.length)
