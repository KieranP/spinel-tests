# frozen_string_literal: true
# SignalException#inspect (#<SignalException: NAME>)
p(SignalException.new("INT").inspect)
i001 = SignalException.new("INT").inspect; p i001

# from an integer signo -> canonical name
p(SignalException.new(15).inspect)
i002 = SignalException.new(15).inspect; p i002

# inspect of a rescued instance
p(begin; raise SignalException.new("TERM"); rescue SignalException => e003; e003.inspect; end)
i004 = (begin; raise SignalException.new("INT"); rescue Exception => e004; e004.inspect; end); p i004

# `p` on a SignalException object uses inspect
p(SignalException.new("INT"))
a005 = SignalException.new("TERM"); p a005
