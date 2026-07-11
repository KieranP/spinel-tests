# frozen_string_literal: true
# Kernel#raise with Interrupt (Interrupt < SignalException < Exception, NOT StandardError)
# raise the class alone uses the default (class name) message
begin; raise Interrupt; rescue Interrupt => e001; p e001.message; p e001.class; end
r001 = (begin; raise Interrupt; rescue Exception => x001; [x001.message, x001.class]; end); p r001

# raise class + message
begin; raise Interrupt, "sig"; rescue Interrupt => e002; p e002.message; p e002.class; end

# raise an instance preserves its message
inst003 = Interrupt.new("inst"); begin; raise inst003; rescue Interrupt => e003; p e003.message; end

# an Interrupt is caught by a SignalException clause
begin; raise Interrupt, "x"; rescue SignalException => e004; p e004.class; end

# an Interrupt is caught by an Exception clause
begin; raise Interrupt, "x"; rescue Exception => e005; p e005.class; end

# a more specific clause is chosen: Interrupt before its ancestors
begin; raise Interrupt, "x"; rescue Interrupt => e006; p :int; rescue Exception => e006b; p :exc; end

# an Interrupt is NOT a StandardError: an explicit StandardError clause must not
# match, so a later Interrupt clause runs. (Spinel wrongly picks StandardError.)
p(begin; raise Interrupt, "x"; rescue StandardError; :std; rescue Interrupt; :int; end)
p(begin; raise Interrupt, "x"; rescue StandardError; :std; rescue SignalException; :sig; end)

# a bare rescue (implicit StandardError) correctly does NOT catch Interrupt: it
# propagates to the outer Interrupt clause (agrees in both).
p(begin
    begin; raise Interrupt, "x"; rescue => eb007; :bare; end
  rescue Interrupt; :propagated; end)
