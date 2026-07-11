# frozen_string_literal: true
# Process.gid

# Real group id (Integer); value is non-deterministic so only class/positivity
# matters. Spinel rejects the call at compile time ("unsupported call `gid`")
# before emitting C, so every form stays commented.
p(Process.gid.class)
a001 = Process.gid; p a001.class
r001 = (Process.gid rescue $!.class); p r001
