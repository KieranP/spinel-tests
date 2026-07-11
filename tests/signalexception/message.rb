# frozen_string_literal: true
# SignalException#message (Exception#message — equals the signal name)
p(SignalException.new("INT").message)
m001 = SignalException.new("INT").message; p m001

# from an integer signo -> canonical signal name
p(SignalException.new(15).message)
m002 = SignalException.new(15).message; p m002

# message and to_s agree
a003 = SignalException.new("TERM"); p(a003.message == a003.to_s)
r003 = (a003.message == a003.to_s); p r003

# a custom message passed with an integer signo is dropped by Spinel
p(SignalException.new(2, "custom").message)
m004 = SignalException.new(2, "custom").message; p m004

# a raised instance's message, read inside the rescue (NOT a StandardError, so it
# must be caught by SignalException / Exception, never a bare rescue)
p(begin; raise SignalException.new("INT"); rescue SignalException => e005; e005.message; end)
m006 = (begin; raise SignalException.new("TERM"); rescue Exception => e006; e006.message; end); p m006

# raising the class by NAME: Ruby resolves the name to its canonical message
p(begin; raise SignalException, "TERM"; rescue Exception => e007; e007.message; end)
m008 = (begin; raise SignalException, "USR1"; rescue Exception => e008; e008.message; end); p m008
