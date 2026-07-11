# frozen_string_literal: true
# SystemExit#inspect (Exception#inspect)
p(SystemExit.new("bye").inspect)
i001 = SystemExit.new("bye").inspect; p i001

# status + message: inspect shows "#<SystemExit: message>"
p(SystemExit.new(3, "custom").inspect)
i002 = SystemExit.new(3, "custom").inspect; p i002

# no message: inspect shows the class name as the message
p(SystemExit.new.inspect)
i003 = SystemExit.new.inspect; p i003
p(SystemExit.new(2).inspect)
i004 = SystemExit.new(2).inspect; p i004

# inspect of a rescued (natural) exit is a non-empty String
r005 = (begin; exit(1); rescue SystemExit => e005; e005.inspect.length > 0; end); p r005

# `p` on a SystemExit object uses inspect
p(SystemExit.new("via p"))
a006 = SystemExit.new("via p"); p a006
