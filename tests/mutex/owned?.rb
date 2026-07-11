# frozen_string_literal: true
# Mutex#owned?
p(Mutex.new.owned?)
m001 = Mutex.new; p m001.owned?
m001.lock; p m001.owned?
m001.unlock; p m001.owned?
# assignment form
m002 = Mutex.new; m002.lock; v002 = m002.owned?; p v002; m002.unlock
# a thread that did not lock the mutex does not own it
m003 = Mutex.new; m003.lock
r003 = nil
t003 = Thread.new { r003 = m003.owned? }
t003.join
p r003
m003.unlock
