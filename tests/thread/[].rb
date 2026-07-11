# frozen_string_literal: true
# Thread#[]
t001 = Thread.new { Thread.current[:k] = 9; Thread.current[:k] }
p t001.value
t002 = Thread.new { Thread.current[:m] = 5; Thread.current[:m] }
v001 = t002.value
p v001
# p Thread.new { Thread.current[:x] = 1 }.tap(&:join).keys   # WONTFIX: not in docs/thread.md Supported API
# p Thread.new { Thread.current["s"] = 1; Thread.current["s"] }.value   # WONTFIX: not in docs/thread.md Supported API (string key; storage is by symbol)
