# frozen_string_literal: true
# Interrupt#instance_of?
f001 = Interrupt.new("m")
p(f001.instance_of?(Interrupt))
r002 = f001.instance_of?(Interrupt); p r002

# instance_of? is exact class only, not ancestors
p(f001.instance_of?(SignalException))
p(f001.instance_of?(Exception))
r003 = f001.instance_of?(SignalException); p r003

# a raised, rescued Interrupt is an instance of Interrupt exactly
p(begin; raise Interrupt, "x"; rescue Exception => e004; e004.instance_of?(Interrupt); end)
