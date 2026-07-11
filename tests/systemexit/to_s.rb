# frozen_string_literal: true
# SystemExit#to_s (Exception#to_s)
# a string argument is the to_s value
p(SystemExit.new("bye").to_s)
s001 = SystemExit.new("bye").to_s; p s001

# status + message: to_s is the message
p(SystemExit.new(3, "custom").to_s)
s002 = SystemExit.new(3, "custom").to_s; p s002

# no message: to_s is the class name
p(SystemExit.new.to_s)
s003 = SystemExit.new.to_s; p s003
p(SystemExit.new(2).to_s)
s004 = SystemExit.new(2).to_s; p s004

# to_s of a rescued (natural) exit is a non-empty String
p(begin; exit(1); rescue SystemExit => e005; e005.to_s.class; end)
r006 = (begin; exit(1); rescue SystemExit => e006; e006.to_s.length > 0; end); p r006
