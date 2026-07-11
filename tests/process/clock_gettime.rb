# frozen_string_literal: true
# Process.clock_gettime

# Default unit is :float_second -> Float. The concrete value is
# non-deterministic, so assert type and monotonicity only.
p(Process.clock_gettime(Process::CLOCK_MONOTONIC).class)

t001 = Process.clock_gettime(Process::CLOCK_MONOTONIC)
u001 = Process.clock_gettime(Process::CLOCK_MONOTONIC)
p(t001.class)
p(u001 >= t001)

# CLOCK_REALTIME is wall-clock: seconds since the Unix epoch (> 1e9 since 2001).
p(Process.clock_gettime(Process::CLOCK_REALTIME) > 1_000_000_000)
r002 = Process.clock_gettime(Process::CLOCK_REALTIME)
p(r002 > 1_000_000_000)

# Integer units yield an Integer; Float units yield a Float.
p(Process.clock_gettime(Process::CLOCK_MONOTONIC, :nanosecond).class)
p(Process.clock_gettime(Process::CLOCK_MONOTONIC, :second).class)
p(Process.clock_gettime(Process::CLOCK_MONOTONIC, :millisecond).class)
p(Process.clock_gettime(Process::CLOCK_MONOTONIC, :microsecond).class)
p(Process.clock_gettime(Process::CLOCK_MONOTONIC, :float_millisecond).class)
p(Process.clock_gettime(Process::CLOCK_MONOTONIC, :float_microsecond).class)
p(Process.clock_gettime(Process::CLOCK_MONOTONIC, :float_second).class)

n003 = Process.clock_gettime(Process::CLOCK_MONOTONIC, :nanosecond)
p(n003.class)
s003 = Process.clock_gettime(Process::CLOCK_MONOTONIC, :second)
p(s003.class)

# An unknown unit symbol raises ArgumentError.
p((Process.clock_gettime(Process::CLOCK_MONOTONIC, :bogus) rescue $!.class))
r004 = (Process.clock_gettime(Process::CLOCK_MONOTONIC, :bogus) rescue $!.class); p r004

# A symbol clock name and a raw integer clock id are also accepted.
p(Process.clock_gettime(:CLOCK_MONOTONIC).class)
p(Process.clock_gettime(0).class)
c005 = Process.clock_gettime(:CLOCK_MONOTONIC)
p(c005.class)
