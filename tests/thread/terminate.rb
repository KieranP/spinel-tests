# frozen_string_literal: true
# Thread#terminate
t001 = Thread.new { sleep 10 }
p t001.terminate.is_a?(Thread)
t001.join
t002 = Thread.new { sleep 10 }
m001 = t002.terminate.is_a?(Thread)
t002.join
p m001
