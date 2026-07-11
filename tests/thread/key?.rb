# frozen_string_literal: true
# Thread#key?
t001 = Thread.new { Thread.current[:k] = 1; [Thread.current.key?(:k), Thread.current.key?(:z)] }
p t001.value
t002 = Thread.new { Thread.current.key?(:absent) }
v001 = t002.value
p v001
