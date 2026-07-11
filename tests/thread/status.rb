# frozen_string_literal: true
# Thread#status
t001 = Thread.new { 1 }
t001.join
p t001.status
s001 = Thread.current.status
p s001
# p Thread.current.priority   # WONTFIX: not in docs/thread.md Supported API
