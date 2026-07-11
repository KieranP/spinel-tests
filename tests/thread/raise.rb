# frozen_string_literal: true
# Thread#raise
t001 = Thread.new { sleep 5 }
t001.raise("boom")
r001 = (t001.join rescue $!.message); p r001
t002 = Thread.new { sleep 5 }
t002.raise(ArgumentError, "x")
r002 = (t002.join rescue $!.class); p r002
# p Thread.new { sleep 5 }.tap { |t| t.raise("z") }.backtrace   # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — Exception#backtrace / Kernel#caller"
