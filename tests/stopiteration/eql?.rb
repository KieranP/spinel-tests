# frozen_string_literal: true
# StopIteration#eql? (Object#eql? — identity for exception instances)
k001 = StopIteration.new("m")
p(k001.eql?(k001))
r002 = k001.eql?(k001); p r002

# distinct instances with equal message are not eql? (identity)
p(StopIteration.new("m").eql?(StopIteration.new("m")))
c003 = (StopIteration.new("m").eql?(StopIteration.new("m"))); p c003

# not eql? to a non-exception
p(k001.eql?("m"))
c004 = k001.eql?("m"); p c004
