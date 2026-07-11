# frozen_string_literal: true
# Thread#to_s
p Thread.new { 1 }.tap(&:join).to_s.start_with?("#<Thread")
t001 = Thread.new { 1 }
t001.join
s001 = t001.to_s.start_with?("#<Thread")
p s001
p Thread.new { 1 }.tap(&:join).to_s.include?(__FILE__)
t002 = Thread.new { 1 }
t002.join
s002 = t002.to_s.include?(__FILE__)
p s002
