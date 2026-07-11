# frozen_string_literal: true
# Process::Tms

# The struct class returned by Process.times.
p(Process::Tms)
a001 = Process::Tms; p a001
r001 = (Process::Tms rescue $!.class); p r001
