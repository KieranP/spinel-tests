# frozen_string_literal: true
# Signal.trap
# SAFE probes only: every trap runs in the short-lived test process and installs a
# handler on signals that are never actually delivered here, so nothing can wedge or
# kill the run. No signal is ever sent. On the current build all forms match CRuby.

# --- Specifier forms accepted on a first trap. USR1/HUP/USR2 are signals left at
# --- their default, so their first trap returns "DEFAULT" in both. ---
p(Signal.trap("USR1", "IGNORE"))
sym001 = :HUP; p(Signal.trap(sym001, "IGNORE"))
p(Signal.trap("SIGUSR2", "IGNORE"))

# --- Re-trapping returns the PREVIOUS handler. Each read-back first installs a KNOWN
# --- handler, then re-traps to read it back. Covers the Integer-number specifier and
# --- every command spelling. ---
Signal.trap(24, "IGNORE")
p(Signal.trap(24, "SIG_DFL"))
Signal.trap("XFSZ", "SIG_IGN")
p(Signal.trap("XFSZ", nil))
Signal.trap("TSTP", "IGNORE")
p(Signal.trap("TSTP") { })
Signal.trap("CONT", "IGNORE")
r001 = Signal.trap("CONT", "DEFAULT"); p(r001)
Signal.trap("URG", "SYSTEM_DEFAULT")
p(Signal.trap("URG", "DEFAULT"))

# A Proc/lambda handler is returned as the Proc object itself.
ph001 = proc { }; Signal.trap("TTIN", ph001)
p(Signal.trap("TTIN", "DEFAULT").class)
la001 = lambda { }; Signal.trap("TTOU", la001)
p(Signal.trap("TTOU", "DEFAULT").class)

# The EXIT pseudo-signal's default handler is nil.
p(Signal.trap("EXIT", "IGNORE"))

# --- Signal-argument validation: Ruby raises for unknown / uncatchable signals and
# --- out-of-range numbers. Rescue-wrapped so the direct form is the assignment form. ---
p((Signal.trap("NOPE", "IGNORE") rescue $!.class))
bad001 = (Signal.trap("BOGUS", "IGNORE") rescue $!.class); p(bad001)
p((Signal.trap("KILL", "IGNORE") rescue $!.class))
p((Signal.trap("STOP", "IGNORE") rescue $!.class))
p((Signal.trap(-1, "IGNORE") rescue $!.class))
p((Signal.trap(9999, "IGNORE") rescue $!.class))

# The Signal module is an ordinary constant; referencing it bare yields the module.
p((Signal rescue $!.class))
mod001 = (Signal rescue nil); p(mod001.nil?)

# An EXIT handler block runs at program exit (kept last so its at-exit line lands
# after everything else).
Signal.trap("EXIT") { puts "exit-handler-ran" }
