# frozen_string_literal: true
# SystemExit.new
p(SystemExit.new(2).class)
p(SystemExit.new(2).status)
p(SystemExit.new("bye").message)
p(SystemExit.new.message)

# SystemExit.new with an explicit status + message
p(SystemExit.new(3, "custom").status)
p(SystemExit.new(3, "custom").message)

# result captured in a variable
a001 = SystemExit.new(2); p a001.status
a002 = SystemExit.new("bye"); p a002.message
a003 = 3; b003 = "custom"; c003 = SystemExit.new(a003, b003); p c003.status; p c003.message
