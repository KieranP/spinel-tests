# frozen_string_literal: true
# Thread#join
p Thread.new { 1 }.join.is_a?(Thread)
t001 = Thread.new { 21 * 2 }
j001 = t001.join
p j001.value
r001 = (Thread.new { raise "oops" }.join rescue $!.message); p r001
# p Thread.new { 1 }.join(0)   # WONTFIX: not in docs/thread.md Supported API (join timeout arg)
