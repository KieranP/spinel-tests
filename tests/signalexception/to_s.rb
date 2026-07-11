# frozen_string_literal: true
# SignalException#to_s (Exception#to_s — the signal name)
p(SignalException.new("INT").to_s)
s001 = SignalException.new("INT").to_s; p s001

# from an integer signo -> canonical name
p(SignalException.new(15).to_s)
s002 = SignalException.new(15).to_s; p s002

# to_s of a rescued instance
p(begin; raise SignalException.new("TERM"); rescue SignalException => e003; e003.to_s; end)
s004 = (begin; raise SignalException.new("INT"); rescue Exception => e004; e004.to_s; end); p s004
