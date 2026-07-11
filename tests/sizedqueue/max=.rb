# frozen_string_literal: true
# SizedQueue#max=

# WONTFIX: not in docs/thread.md Supported API (SizedQueue is listed as
# "Queue plus #max"; the writer is absent, and the call cleanly front-end-rejects)
# a001 = SizedQueue.new(3)
# p a001.max
# a001.max = 5
# p a001.max
# a002 = SizedQueue.new(3)
# c002 = (a002.max = 5)
# p c002
p SizedQueue.new(3).max
