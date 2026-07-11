# frozen_string_literal: true
# Process::CLOCK_PROCESS_CPUTIME_ID

# Spinel defines only CLOCK_MONOTONIC and CLOCK_REALTIME; the other documented
# POSIX clock constants are undefined. Reading one raises a (rescuable)
# NameError at runtime instead of yielding its integer value.
r001 = (Process::CLOCK_PROCESS_CPUTIME_ID rescue $!.class)
p r001
r002 = (Process::CLOCK_THREAD_CPUTIME_ID rescue $!.class)
p r002

# Passed straight to a builtin, the unknown constant fails to compile instead,
# so this form is kept commented out.
p(Process::CLOCK_PROCESS_CPUTIME_ID)
