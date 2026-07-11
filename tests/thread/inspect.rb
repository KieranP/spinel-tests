# frozen_string_literal: true
# Thread#inspect
p Thread.new { 1 }.tap(&:join).inspect.start_with?("#<Thread")
t001 = Thread.new { 1 }
t001.join
i001 = t001.inspect.start_with?("#<Thread")
p i001
p Thread.new { 1 }.tap(&:join).inspect.include?(__FILE__)
t002 = Thread.new { 1 }
t002.join
i002 = t002.inspect.include?(__FILE__)
p i002
