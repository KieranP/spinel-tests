# frozen_string_literal: true
# FrozenError#eql? (Object#eql? — identity for exception instances)
f001 = FrozenError.new("m")
p(f001.eql?(f001))
r002 = f001.eql?(f001); p r002

# distinct instances with equal message are not eql? (identity)
p(FrozenError.new("m").eql?(FrozenError.new("m")))
c003 = (FrozenError.new("m").eql?(FrozenError.new("m"))); p c003

# not eql? to a non-exception
p(f001.eql?("m"))
