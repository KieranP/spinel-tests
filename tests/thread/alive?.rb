# frozen_string_literal: true
# Thread#alive?
t001 = Thread.new { 1 }
t001.join
p t001.alive?
a001 = Thread.current.alive?
p a001
