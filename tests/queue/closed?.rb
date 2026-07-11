# frozen_string_literal: true
# Queue#closed?
q001 = Queue.new
p q001.closed?
q001.close
p q001.closed?
v001 = q001.closed?
p v001

q002 = Queue.new
p(q002.closed?)
q002.push(1)
q002.close
p(q002.closed?)
