# frozen_string_literal: true
# Process.ppid

# The concrete ppid is non-deterministic, so assert stable properties only.
p(Process.ppid.class)
p(Process.ppid > 0)
p(Process.ppid.is_a?(Integer))

# stable within a single run
p(Process.ppid == Process.ppid)

# the parent is not this process
p(Process.ppid != Process.pid)

# assignment form
a001 = Process.ppid
p a001.class
p a001 > 0
p(a001 == Process.ppid)

# the ppid participates in ordinary Integer operations
p(Process.ppid.to_s.class)
p((Process.ppid + 0).class)
b002 = Process.ppid
p((b002 * 1) == Process.ppid)
