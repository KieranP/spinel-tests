# frozen_string_literal: true
# ConditionVariable#broadcast

# broadcasting with no waiter is a no-op
m001 = Mutex.new
a001 = ConditionVariable.new
p a001.broadcast.class
m001.synchronize { p a001.broadcast.class }

m002 = Mutex.new
a002 = ConditionVariable.new
c002 = a002.broadcast
p c002.class
p c002 == a002
m002.synchronize { p a002.broadcast.class }

# one broadcast releases every waiter
m003 = Mutex.new
a003 = ConditionVariable.new
open003 = false
woke003 = []
lock003 = Mutex.new
ts003 = 4.times.map do |i|
  Thread.new do
    m003.synchronize { a003.wait(m003) until open003 }
    lock003.synchronize { woke003 << i }
  end
end
m003.synchronize do
  open003 = true
  a003.broadcast
end
ts003.each(&:join)
p woke003.length
p woke003.sort
p open003

# a barrier: every worker waits for the last arrival before proceeding
m004 = Mutex.new
a004 = ConditionVariable.new
arrived004 = 0
order004 = []
lock004 = Mutex.new
WORKERS004 = 3
ts004 = WORKERS004.times.map do |i|
  Thread.new do
    m004.synchronize do
      arrived004 += 1
      if arrived004 == WORKERS004
        a004.broadcast
      else
        a004.wait(m004) while arrived004 < WORKERS004
      end
    end
    lock004.synchronize { order004 << i * i }
  end
end
ts004.each(&:join)
p arrived004
p order004.sort
p order004.length
