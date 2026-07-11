# frozen_string_literal: true
# Process.kill
# Signal 0 sends nothing; it probes for the process's existence and returns the number
# of processes signaled (1 for self).
p(Process.kill(0, Process.pid))
n001 = Process.kill(0, Process.pid); p(n001)

# Named / Symbol / numeric signals return the count too. USR1's default action would terminate
# the process, so an IGNORE handler is installed first to keep these safe to run.
Signal.trap("USR1", "IGNORE")
p(Process.kill("USR1", Process.pid))
p(Process.kill(:USR1, Process.pid))
p(Process.kill(30, Process.pid))
s002 = Process.kill("USR1", Process.pid); p(s002)

# A delivered signal must invoke an installed handler.
got001 = []; Signal.trap("USR1") { got001 << 1 }; Process.kill("USR1", Process.pid); sleep 0.1; p(got001)
