# frozen_string_literal: true
# Mutex#try_lock
p(Mutex.new.try_lock)
m001 = Mutex.new; v001 = m001.try_lock; p v001
p m001.locked?
# try_lock on a mutex already held (by this thread) returns false
p m001.try_lock
m001.unlock
# multi-thread mutual exclusion via a try_lock spin: total stays 8000
m002 = Mutex.new
c002 = 0
t002 = 8.times.map do
  Thread.new do
    done002 = 0
    while done002 < 1000
      if m002.try_lock
        c002 += 1
        done002 += 1
        m002.unlock
      end
    end
  end
end
t002.each(&:join)
p c002
