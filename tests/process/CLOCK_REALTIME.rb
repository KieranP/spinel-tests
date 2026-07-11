# frozen_string_literal: true
# Process::CLOCK_REALTIME

p(Process::CLOCK_REALTIME.class)
p(Process::CLOCK_REALTIME)

a001 = Process::CLOCK_REALTIME
p a001.class
p a001

# usable as a clock_gettime selector
p(Process.clock_gettime(Process::CLOCK_REALTIME).class)
