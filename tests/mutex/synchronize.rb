# frozen_string_literal: true
# Mutex#synchronize
p(Mutex.new.synchronize { 42 })
m001 = Mutex.new; v001 = m001.synchronize { "hello" }; p v001
# the lock is released once the block returns
m002 = Mutex.new; m002.synchronize { }; p m002.locked?
# multi-thread mutual exclusion: 8 threads * 1000 increments == 8000
m003 = Mutex.new
c003 = 0
t003 = 8.times.map do
  Thread.new do
    1000.times { m003.synchronize { c003 += 1 } }
  end
end
t003.each(&:join)
p c003

# across threads (the split read/write form does not). Runs; diverges only on some runs.
h222 = { "a" => 0 }
l222 = Mutex.new
q222 = Queue.new
2000.times { q222 << 1 }
4.times { q222 << nil }
t222 = 4.times.map do
  Thread.new do
    loop do
      v222 = q222.pop
      break if v222.nil?
      l222.synchronize { h222["a"] += 1 }
    end
  end
end
t222.each(&:join)
p(h222["a"])
v223 = h222["a"]; p v223

# yielding a Mutex to a block from inside Thread.new
def race274(label)
  h = { "a" => 0 }
  lock = Mutex.new
  ts = 2.times.map { Thread.new { yield(lock, h) } }
  ts.each(&:join)
  "#{label}: #{h["a"]}"
end
p(race274("one") { |lock, h| lock.synchronize { h["a"] += 1 } })
v274 = race274("two") { |lock, h| lock.synchronize { h["a"] += 1 } }; p v274
