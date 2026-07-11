# frozen_string_literal: true
# SignalException#== (Exception#==)
# equal: same class and same message
p(SignalException.new("INT") == SignalException.new("INT"))
a001 = SignalException.new("INT"); b001 = SignalException.new("INT"); p(a001 == b001)
c001 = (SignalException.new("INT") == SignalException.new("INT")); p c001

# a name and its equivalent number produce equal objects
p(SignalException.new("INT") == SignalException.new(2))
c002 = (SignalException.new("INT") == SignalException.new(2)); p c002

# different signal -> not equal
p(SignalException.new("INT") == SignalException.new("TERM"))
a003 = SignalException.new("INT"); b003 = SignalException.new("TERM"); p(a003 == b003)

# reflexive
a004 = SignalException.new("INT"); p(a004 == a004)
c004 = (a004 == a004); p c004

# not equal to a non-exception
p(SignalException.new("INT") == "INT")
c005 = (SignalException.new("INT") == "INT"); p c005
