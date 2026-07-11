# frozen_string_literal: true
# SignalException#is_a? / #kind_of? (SignalException < Exception, NOT StandardError)
f001 = SignalException.new("INT")
p(f001.is_a?(SignalException))
p(f001.is_a?(Exception))
p(f001.is_a?(StandardError))
p(f001.is_a?(Object))
r002 = f001.is_a?(Exception); p r002

# kind_of? is the alias
p(f001.kind_of?(SignalException))
p(f001.kind_of?(Exception))
r003 = f001.kind_of?(StandardError); p r003

# a raised, rescued SignalException keeps the hierarchy
p(begin; raise SignalException.new("INT"); rescue Exception => e004; e004.is_a?(SignalException); end)
r005 = (begin; raise SignalException.new("TERM"); rescue Exception => e005; e005.is_a?(StandardError); end); p r005
