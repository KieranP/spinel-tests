# frozen_string_literal: true
# Mutex#freeze

p(Mutex.new.freeze.class)
a001 = Mutex.new
a001.freeze
p a001.class
a002 = Mutex.new
c002 = a002.freeze
p c002.class
p c002.frozen?
p a002.locked?
