# frozen_string_literal: true
# Process.getsid

# Session id of this process (Integer); value is non-deterministic so only class
# matters. Spinel rejects the call at compile time ("unsupported call `getsid`")
# before emitting C, so every form stays commented.
p(Process.getsid.class)
a001 = Process.getsid; p a001.class
r001 = (Process.getsid rescue $!.class); p r001
