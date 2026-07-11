# frozen_string_literal: true
# SignalException#class
p(SignalException.new("INT").class)
c001 = SignalException.new("INT").class; p c001

# a rescued SignalException reports its concrete class
p(begin; raise SignalException.new("INT"); rescue SignalException => e002; e002.class; end)
c003 = (begin; raise SignalException.new("TERM"); rescue Exception => e003; e003.class; end); p c003

# class name via Module#name and Module#to_s
p(SignalException.new("INT").class.name)
p(SignalException.new("INT").class.to_s)

# two instances share a class
c004 = (SignalException.new("INT").class == SignalException.new("TERM").class); p c004

# --- class hierarchy via the *constant* (these agree) ---
p(SignalException.superclass)
c005 = SignalException.superclass; p c005
p(SignalException.ancestors)
c006 = SignalException.ancestors; p c006

# --- hierarchy via an *instance's* .class collapses to Object in Spinel ---
p(SignalException.new("INT").class.superclass)
c007 = SignalException.new("INT").class.superclass; p c007
p(SignalException.new("INT").class.ancestors)
c008 = SignalException.new("INT").class.ancestors; p c008
