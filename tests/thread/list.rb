# frozen_string_literal: true
# Thread.list
p Thread.list.is_a?(Array)
p Thread.list.include?(Thread.current)
l001 = Thread.list
p l001.include?(Thread.main)
