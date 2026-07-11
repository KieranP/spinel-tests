# frozen_string_literal: true
# Queue#size
q001 = Queue.new
p q001.size
q001.push(1)
q001.push(2)
p q001.size
q001.pop
p q001.size
v001 = q001.size
p v001

q002 = Queue.new
q002.push(1)
q002.push(2)
q002.push(3)
p(q002.size)

# num_waiting is not in docs/thread.md's Supported API (clean front-end reject)
# WONTFIX: not in docs/thread.md Supported API
# p q001.num_waiting
