# frozen_string_literal: true
# ConditionVariable#signal

# signalling with no waiter is a no-op
m001 = Mutex.new
a001 = ConditionVariable.new
p a001.signal.class
m001.synchronize { p a001.signal.class }

m002 = Mutex.new
a002 = ConditionVariable.new
c002 = a002.signal
p c002.class
p c002 == a002
m002.synchronize { p a002.signal.class }

# a signal releases exactly one waiter
m003 = Mutex.new
a003 = ConditionVariable.new
token003 = 0
woke003 = []
lock003 = Mutex.new
ts003 = 2.times.map do |i|
  Thread.new do
    m003.synchronize do
      a003.wait(m003) while token003.zero?
      token003 -= 1
    end
    lock003.synchronize { woke003 << i }
  end
end
m003.synchronize do
  token003 += 1
  a003.signal
end
# release the second waiter too, so the test terminates
m003.synchronize do
  token003 += 1
  a003.signal
end
ts003.each(&:join)
p woke003.length
p woke003.sort
p token003

# signal handing over a value at a time, in order
m004 = Mutex.new
a004 = ConditionVariable.new
box004 = []
got004 = []
t004 = Thread.new do
  3.times do
    m004.synchronize do
      a004.wait(m004) while box004.empty?
      got004 << box004.shift
    end
  end
end
%w[x y z].each do |v|
  m004.synchronize do
    box004 << v
    a004.signal
  end
  Thread.pass
end
t004.join
p got004
p box004.empty?
