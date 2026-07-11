# frozen_string_literal: true
# Interrupt#signo (SignalException#signo — Interrupt is always SIGINT, signo 2)
p(Interrupt.new.signo)
s001 = Interrupt.new.signo; p s001

# a message argument does not change the signal number
p(Interrupt.new("boom").signo)
s002 = Interrupt.new("boom").signo; p s002

# raising an Interrupt INSTANCE keeps the correct signo (2)
begin; raise Interrupt.new("x"); rescue Interrupt => e003; p e003.signo; end
s004 = (begin; raise Interrupt.new; rescue SignalException => e004; e004.signo; end); p s004

# raising the Interrupt CLASS loses the signo (Spinel reports 0, Ruby 2)
begin; raise Interrupt, "x"; rescue Interrupt => e005; p e005.signo; end
s006 = (begin; raise Interrupt; rescue SignalException => e006; e006.signo; end); p s006
