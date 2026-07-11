# frozen_string_literal: true
# SignalException#signo (the signal number)
p(SignalException.new("INT").signo)
s001 = SignalException.new("INT").signo; p s001

# from an integer signo argument
p(SignalException.new(15).signo)
s002 = SignalException.new(15).signo; p s002

# from a SIG-prefixed name
p(SignalException.new("SIGTERM").signo)
s003 = SignalException.new("SIGTERM").signo; p s003

# raising an INSTANCE keeps the signo
p(begin; raise SignalException.new("INT"); rescue SignalException => e004; e004.signo; end)
s005 = (begin; raise SignalException.new("TERM"); rescue Exception => e005; e005.signo; end); p s005

# raising the class by NAME: Ruby resolves the name (signo 15); Spinel reports 0
p(begin; raise SignalException, "TERM"; rescue Exception => e006; e006.signo; end)
s007 = (begin; raise SignalException, "INT"; rescue Exception => e007; e007.signo; end); p s007
