# frozen_string_literal: true
# Interrupt#eql? (Object#eql? — identity for exception instances)
f001 = Interrupt.new("m")
p(f001.eql?(f001))
r002 = f001.eql?(f001); p r002

# distinct instances with equal message are not eql? (identity)
p(Interrupt.new("m").eql?(Interrupt.new("m")))
c003 = (Interrupt.new("m").eql?(Interrupt.new("m"))); p c003

# not eql? to a non-exception
p(f001.eql?("m"))
