# frozen_string_literal: true
# KeyError#eql? (Object#eql? — identity for exception instances)
k001 = KeyError.new("m")
p(k001.eql?(k001))
r002 = k001.eql?(k001); p r002

# distinct instances with equal message are not eql? (identity)
p(KeyError.new("m").eql?(KeyError.new("m")))
c003 = (KeyError.new("m").eql?(KeyError.new("m"))); p c003

# not eql? to a non-exception
p(k001.eql?("m"))
