# frozen_string_literal: true
# Process.clock_getres

# Companion to the supported Process.clock_gettime: returns the resolution of a
# clock (a Float in :float_second, the default). The value is platform-specific,
# so only the class would be asserted. Spinel rejects the call at compile time
# ("unsupported call `clock_getres`") before emitting C — unlike clock_gettime,
# which is supported — so every form stays commented.
p(Process.clock_getres(Process::CLOCK_MONOTONIC).class)
a001 = Process.clock_getres(Process::CLOCK_MONOTONIC); p a001.class
r001 = (Process.clock_getres(Process::CLOCK_MONOTONIC) rescue $!.class); p r001
