# frozen_string_literal: true
# SignalException.new (SignalException < Exception, NOT StandardError)
# construct from a signal name string
p(SignalException.new("INT").class)
n001 = SignalException.new("INT"); p n001.class

# construct from a signal number
p(SignalException.new(2).signo)
n002 = SignalException.new(2); p n002.signo

# name with SIG prefix
p(SignalException.new("SIGTERM").signm)
n003 = SignalException.new("SIGTERM"); p n003.signm

# a constructed instance is a SignalException / Exception, but not a StandardError
p(SignalException.new("INT").is_a?(Exception))
n004 = SignalException.new("INT"); p n004.is_a?(StandardError)

# two-argument (signo, signm) form: the custom message is dropped by Spinel
p(SignalException.new(2, "custom").message)
n005 = SignalException.new(2, "custom").message; p n005

# the illegal (name, extra) form raises ArgumentError under Ruby
r006 = (SignalException.new("INT", "custom") rescue $!.class); p r006

# no-argument form raises ArgumentError (agrees)
r007 = (SignalException.new rescue $!.class); p r007

# the constant and its hierarchy
p(defined?(SignalException))
p(SignalException.superclass)
