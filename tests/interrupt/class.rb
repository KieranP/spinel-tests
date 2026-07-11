# frozen_string_literal: true
# Interrupt#class
# the class of an Interrupt instance
p(Interrupt.new("x").class)
c001 = Interrupt.new("x").class; p c001

p(Interrupt.new.class)
c002 = Interrupt.new.class; p c002

# a rescued Interrupt reports its concrete class
begin; raise Interrupt, "t"; rescue Interrupt => e003; p e003.class; end
c004 = (begin; raise Interrupt, "t"; rescue Exception => e004; e004.class; end); p c004

# raising the class alone still reports Interrupt
begin; raise Interrupt; rescue Exception => e005; p e005.class; end

# class name via Module#name and Module#to_s
p(Interrupt.new("n").class.name)
p(Interrupt.new("n").class.to_s)

# two instances of the same class share a class
c006 = (Interrupt.new("a").class == Interrupt.new("b").class); p c006

# --- class hierarchy via the *constant* (these agree) ---
p(Interrupt.superclass)
c007 = Interrupt.superclass; p c007
p(Interrupt.ancestors)
c008 = Interrupt.ancestors; p c008

# --- class hierarchy via an *instance's* .class collapses to Object in Spinel ---
p(Interrupt.new("m").class.superclass)
c009 = Interrupt.new("m").class.superclass; p c009
p(Interrupt.new("m").class.ancestors)
c010 = Interrupt.new("m").class.ancestors; p c010
