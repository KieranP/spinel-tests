# frozen_string_literal: true
# Thread#exit
t001 = Thread.new { sleep 10 }
p t001.exit.is_a?(Thread)
t001.join
t002 = Thread.new { sleep 10 }
e001 = t002.exit.is_a?(Thread)
t002.join
p e001
