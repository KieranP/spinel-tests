# frozen_string_literal: true
# Kernel#raise with SignalException (SignalException < Exception, NOT StandardError)
# raise a constructed INSTANCE preserves its signal
inst001 = SignalException.new("INT"); begin; raise inst001; rescue SignalException => e001; p e001.signo; p e001.class; end
r001 = (begin; raise SignalException.new("TERM"); rescue Exception => x001; [x001.signo, x001.class]; end); p r001

# a SignalException is caught by an Exception clause
p(begin; raise SignalException.new("INT"); rescue Exception => e002; e002.class; end)

# raise the class by NAME: Ruby resolves the name; Spinel treats it as a plain message
p(begin; raise SignalException, "TERM"; rescue Exception => e003; [e003.signo, e003.signm]; end)

# a SignalException is NOT a StandardError: an explicit StandardError clause must not
# match, so a later SignalException clause runs. (Spinel wrongly picks StandardError.)
p(begin; raise SignalException.new("INT"); rescue StandardError; :std; rescue SignalException; :sig; end)
r004 = (begin; raise SignalException.new("TERM"); rescue StandardError; :std; rescue Exception; :exc; end); p r004

# a bare rescue (implicit StandardError) correctly does NOT catch it: it propagates
# to the outer SignalException clause (agrees in both).
p(begin
    begin; raise SignalException.new("INT"); rescue => eb005; :bare; end
  rescue SignalException; :propagated; end)
