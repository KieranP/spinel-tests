# frozen_string_literal: true
# Thread.current
p Thread.current.is_a?(Thread)
p Thread.current == Thread.main
c001 = Thread.current
p c001.equal?(Thread.current)
p Thread.current.class
# p Thread.current.stop?     # WONTFIX: not in docs/thread.md Supported API
# p Thread.current.group     # WONTFIX: not in docs/thread.md Supported API
