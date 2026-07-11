# frozen_string_literal: true
# Mutex#frozen?

p(Mutex.new.frozen?)
a001 = Mutex.new
p a001.frozen?
a002 = Mutex.new
a002.freeze
p a002.frozen?
a003 = Mutex.new
c003 = a003.frozen?
p c003.class
p c003
