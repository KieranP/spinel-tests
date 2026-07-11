# frozen_string_literal: true
# Interrupt.new (Interrupt < SignalException < Exception; always SIGINT)
# String message
p(Interrupt.new("boom").message)
n001 = Interrupt.new("boom"); p n001.message

# no argument -> default (class name) message
p(Interrupt.new.class)
n002 = Interrupt.new; p n002.message

# explicit nil message defaults to the class name
p(Interrupt.new(nil).message)
n003 = Interrupt.new(nil).message; p n003

# constructed instance is an Interrupt
p(Interrupt.new("m").class)
n004 = Interrupt.new("m"); p n004.class

# the signal number is SIGINT (2) regardless of the message
p(Interrupt.new("anything").signo)
n005 = Interrupt.new("anything").signo; p n005

# referencing the constant and its hierarchy
p(defined?(Interrupt))
p(Interrupt.superclass)

# raising a constructed instance preserves its message (caught as Interrupt,
# NOT via a bare rescue — Interrupt is not a StandardError)
p(begin; raise Interrupt.new("boom"); rescue Interrupt => e006; e006.message; end)
r007 = (begin; raise Interrupt.new("boom"); rescue Interrupt => e007; e007.message; end); p r007

# non-String message argument is stringified
p Interrupt.new(42).message
p Interrupt.new(:sym).message
