# frozen_string_literal: true
# Process.getpriority

# Scheduling priority of a process (Integer). Read-only and safe, but the value
# is machine-specific so only the class would be asserted. Spinel rejects the
# call at compile time ("unsupported call `getpriority`") before emitting C, so
# every form stays commented.
p(Process.getpriority(Process::PRIO_PROCESS, 0).class)
a001 = Process.getpriority(Process::PRIO_PROCESS, 0); p a001.class
r001 = (Process.getpriority(Process::PRIO_PROCESS, 0) rescue $!.class); p r001
