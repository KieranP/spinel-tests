# frozen_string_literal: true
# Thread#kill
t001 = Thread.new { sleep 10 }
p t001.kill.is_a?(Thread)
t001.join
t002 = Thread.new { sleep 10 }
k001 = t002.kill.is_a?(Thread)
t002.join
p k001
