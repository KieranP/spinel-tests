# frozen_string_literal: true
# Kernel#trap

# Kernel#trap is the private alias of Signal.trap; called without a receiver it
# shares the same "always returns DEFAULT" return-value bug.
p(trap("USR1", "IGNORE"))

# Re-trapping must return the previously-installed handler.
trap("HUP", "IGNORE")
p(trap("HUP", "DEFAULT"))
trap("USR2", "IGNORE")
r001 = trap("USR2") { }; p(r001)

# An unknown signal name must raise ArgumentError; Spinel returns "DEFAULT".
p((trap("NOPE", "IGNORE") rescue $!.class))
bad001 = (trap("BOGUS", "IGNORE") rescue $!.class); p(bad001)
