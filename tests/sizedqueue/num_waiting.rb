# frozen_string_literal: true
# SizedQueue#num_waiting

# WONTFIX: not in docs/thread.md Supported API (the Queue / SizedQueue row lists
# push/<</pop/size/empty?/close/closed?/clear plus #max; the call cleanly front-end-rejects)
# a001 = SizedQueue.new(2)
# p a001.num_waiting
# a002 = SizedQueue.new(2)
# c002 = a002.num_waiting
# p c002.class
# p c002
p SizedQueue.new(2).empty?
