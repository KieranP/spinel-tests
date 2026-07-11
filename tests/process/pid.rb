# frozen_string_literal: true
# Process.pid

# The concrete pid is non-deterministic, so assert stable properties only.
p(Process.pid.class)
p(Process.pid > 0)
p(Process.pid.is_a?(Integer))

# stable within a single run
p(Process.pid == Process.pid)

# assignment form
a001 = Process.pid
p a001.class
p a001 > 0
p(a001 == Process.pid)

# a captured pid keeps its value
b002 = Process.pid
c002 = Process.pid
p(b002 == c002)

# the pid participates in ordinary Integer operations
p(Process.pid.to_s.class)
p((Process.pid + 0).class)
p((Process.pid & Process.pid) == Process.pid)
p(Process.pid.even? || Process.pid.odd?)
d003 = Process.pid
p((d003 * 1) == Process.pid)
