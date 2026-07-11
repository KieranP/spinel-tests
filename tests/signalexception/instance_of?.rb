# frozen_string_literal: true
# SignalException#instance_of?
f001 = SignalException.new("INT")
p(f001.instance_of?(SignalException))
r002 = f001.instance_of?(SignalException); p r002

# instance_of? is exact class only, not ancestors
p(f001.instance_of?(Exception))
r003 = f001.instance_of?(Exception); p r003

# not a StandardError ancestor at all, so this agrees (false in both)
p(f001.instance_of?(StandardError))

# a raised, rescued SignalException is an instance of SignalException exactly
p(begin; raise SignalException.new("INT"); rescue Exception => e004; e004.instance_of?(SignalException); end)
