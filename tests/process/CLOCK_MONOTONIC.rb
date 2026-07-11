# frozen_string_literal: true
# Process::CLOCK_MONOTONIC

p(Process::CLOCK_MONOTONIC.class)
p(Process::CLOCK_MONOTONIC)

a001 = Process::CLOCK_MONOTONIC
p a001.class
p a001

# usable as a clock_gettime selector regardless of its numeric value
p(Process.clock_gettime(Process::CLOCK_MONOTONIC).class)
