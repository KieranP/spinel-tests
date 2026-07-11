# frozen_string_literal: true
# Interrupt#to_s
p(Interrupt.new("boom").to_s)
s001 = Interrupt.new("boom").to_s; p s001

# default to_s is the class name
p(Interrupt.new.to_s)
s002 = Interrupt.new.to_s; p s002

# explicit nil argument falls back to the class name
p(Interrupt.new(nil).to_s)
s003 = Interrupt.new(nil).to_s; p s003

# to_s of a rescued Interrupt
begin; raise Interrupt, "raised"; rescue Interrupt => e004; p e004.to_s; end
s005 = (begin; raise Interrupt, "raised"; rescue SignalException => e005; e005.to_s; end); p s005
