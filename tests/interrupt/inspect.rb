# frozen_string_literal: true
# Interrupt#inspect
p(Interrupt.new("boom").inspect)
i001 = Interrupt.new("boom").inspect; p i001

# no message: inspect shows the default (class name) message
p(Interrupt.new.inspect)
i002 = Interrupt.new.inspect; p i002

# inspect of a rescued Interrupt
begin; raise Interrupt, "sig"; rescue Interrupt => e003; p e003.inspect; end
i004 = (begin; raise Interrupt, "sig"; rescue Interrupt => e004; e004.inspect; end); p i004

# `p` on an Interrupt object uses inspect
p(Interrupt.new("via p"))
a005 = Interrupt.new("via p"); p a005
