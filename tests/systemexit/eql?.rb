# frozen_string_literal: true
# SystemExit#eql? (Object#eql? — identity for exception instances)
k001 = SystemExit.new(2)
p(k001.eql?(k001))
r002 = k001.eql?(k001); p r002

# distinct instances with equal status/message are not eql? (identity)
p(SystemExit.new(2).eql?(SystemExit.new(2)))
c003 = (SystemExit.new(2).eql?(SystemExit.new(2))); p c003

# not eql? to a non-exception
p(k001.eql?("m"))
c004 = k001.eql?(2); p c004
