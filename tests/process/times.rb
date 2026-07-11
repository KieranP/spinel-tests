# frozen_string_literal: true
# Process.times

# Returns a Process::Tms with four Float accumulators (utime/stime/cutime/cstime).
# The concrete times are non-deterministic, so only the class and non-negativity
# are asserted.
p(Process.times.class)
a001 = Process.times; p a001.class
p(Process.times.utime.class)
p(Process.times.stime.class)
p(Process.times.cutime.class)
p(Process.times.cstime.class)
p(Process.times.utime >= 0.0)
r001 = (Process.times rescue $!.class); p r001.class
