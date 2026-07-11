# frozen_string_literal: true
# SignalException#signm (the signal message string)
p(SignalException.new("INT").signm)
s001 = SignalException.new("INT").signm; p s001

# from an integer signo argument -> canonical name
p(SignalException.new(15).signm)
s002 = SignalException.new(15).signm; p s002

# SIG prefix is preserved on the canonical name
p(SignalException.new("SIGTERM").signm)
s003 = SignalException.new("SIGTERM").signm; p s003

# a custom signm passed alongside an integer signo is dropped by Spinel
p(SignalException.new(2, "custom").signm)
s004 = SignalException.new(2, "custom").signm; p s004

# raising an INSTANCE keeps the signm
p(begin; raise SignalException.new("INT"); rescue SignalException => e005; e005.signm; end)
s006 = (begin; raise SignalException.new("USR1"); rescue Exception => e006; e006.signm; end); p s006

# raising the class by NAME: Ruby resolves to the canonical name; Spinel keeps the raw string
p(begin; raise SignalException, "USR1"; rescue Exception => e007; e007.signm; end)
s008 = (begin; raise SignalException, "TERM"; rescue Exception => e008; e008.signm; end); p s008
