# frozen_string_literal: true
# Interrupt#is_a? / #kind_of? (Interrupt < SignalException < Exception)
f001 = Interrupt.new("m")
p(f001.is_a?(Interrupt))
p(f001.is_a?(SignalException))
p(f001.is_a?(Exception))
p(f001.is_a?(StandardError))
p(f001.is_a?(RuntimeError))
r002 = f001.is_a?(SignalException); p r002

# kind_of? is the alias
p(f001.kind_of?(SignalException))
p(f001.kind_of?(Exception))
r003 = f001.kind_of?(StandardError); p r003

# a raised, rescued Interrupt keeps the hierarchy
p(begin; raise Interrupt, "x"; rescue Exception => e004; e004.is_a?(SignalException); end)
r005 = (begin; raise Interrupt, "x"; rescue Exception => e005; e005.is_a?(StandardError); end); p r005
