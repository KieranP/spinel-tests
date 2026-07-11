# frozen_string_literal: true
# SignalException#eql? (Object#eql? — identity for exception instances)
f001 = SignalException.new("INT")
p(f001.eql?(f001))
r002 = f001.eql?(f001); p r002

# distinct instances with equal signal are not eql? (identity)
p(SignalException.new("INT").eql?(SignalException.new("INT")))
c003 = (SignalException.new("INT").eql?(SignalException.new("INT"))); p c003

# not eql? to a non-exception
p(f001.eql?("INT"))
