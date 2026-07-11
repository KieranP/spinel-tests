# frozen_string_literal: true
# Mutex#locked?
p(Mutex.new.locked?)
m001 = Mutex.new; p m001.locked?
m001.lock; p m001.locked?
m001.unlock; p m001.locked?
# assignment form
m002 = Mutex.new; m002.lock; v002 = m002.locked?; p v002; m002.unlock
# a Mutex on the RIGHT of && keeps compiling, but the value loses its class
m003 = Mutex.new
v003 = (:probe && m003)
p v003.class
m006 = Mutex.new
p(m006 && m006.locked?)
