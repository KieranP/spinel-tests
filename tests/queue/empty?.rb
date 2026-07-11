# frozen_string_literal: true
# Queue#empty?
q001 = Queue.new
p q001.empty?
q001.push(1)
p q001.empty?
q001.pop
p q001.empty?
v001 = q001.empty?
p v001

q002 = Queue.new
p(q002.empty?)
q002.push(5)
p(q002.empty?)
