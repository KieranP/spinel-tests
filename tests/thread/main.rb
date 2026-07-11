# frozen_string_literal: true
# Thread.main
p Thread.main.is_a?(Thread)
m001 = Thread.main
p m001 == Thread.current
