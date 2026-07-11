# frozen_string_literal: true
# Interrupt#message (Interrupt < SignalException < Exception)
p(Interrupt.new("boom").message)
m001 = Interrupt.new("boom").message; p m001

# default message is the class name
p(Interrupt.new.message)
m002 = Interrupt.new.message; p m002

# explicit nil argument falls back to the class name
p(Interrupt.new(nil).message)
m003 = Interrupt.new(nil).message; p m003

# non-String message argument is stringified
p(Interrupt.new(42).message)
m004 = Interrupt.new(42).message; p m004
p(Interrupt.new(:sym).message)
m005 = Interrupt.new(:sym).message; p m005

# message and to_s agree
a006 = Interrupt.new("z"); p(a006.message == a006.to_s)
r006 = (a006.message == a006.to_s); p r006

# a raised Interrupt's message, read inside the rescue (Interrupt is NOT a
# StandardError, so it must be caught by Interrupt / SignalException / Exception)
begin; raise Interrupt, "raised"; rescue Interrupt => e007; p e007.message; end
m008 = (begin; raise Interrupt, "raised"; rescue SignalException => e008; e008.message; end); p m008

# raising the class alone uses the default (class name) message
begin; raise Interrupt; rescue Exception => e009; p e009.message; end

# raising a constructed instance preserves its message
begin; raise Interrupt.new("inst"); rescue Interrupt => e010; p e010.message; end
m011 = (begin; raise Interrupt.new("inst"); rescue Interrupt => e011; e011.message; end); p m011

# Interrupt is a SignalException, and so an Exception but not a StandardError
p(Interrupt.ancestors.include?(SignalException))
a005 = Interrupt.ancestors.include?(StandardError); p a005
r006 = (begin; raise Interrupt; rescue Interrupt => e006; e006.class.to_s; end); p r006
r007 = (begin; raise Interrupt, "sig"; rescue Exception => e007; e007.message; end); p r007
