# frozen_string_literal: true
# Interrupt#signm (SignalException#signm — the signal message string)
p(Interrupt.new.signm)
s001 = Interrupt.new.signm; p s001

# with an explicit message, signm reports it
p(Interrupt.new("boom").signm)
s002 = Interrupt.new("boom").signm; p s002

# signm of a rescued Interrupt
begin; raise Interrupt, "x"; rescue Interrupt => e003; p e003.signm; end
s004 = (begin; raise Interrupt.new("inst"); rescue SignalException => e004; e004.signm; end); p s004
