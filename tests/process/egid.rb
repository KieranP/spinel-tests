# frozen_string_literal: true
# Process.egid

# Effective group id (Integer); value is non-deterministic so only class matters.
# Spinel rejects the call at compile time ("unsupported call `egid`") before
# emitting C, so every form stays commented.
p(Process.egid.class)
a001 = Process.egid; p a001.class
r001 = (Process.egid rescue $!.class); p r001
