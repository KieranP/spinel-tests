# frozen_string_literal: true
# Process.euid

# Effective user id (Integer); value is non-deterministic so only class matters.
# Spinel rejects the call at compile time ("unsupported call `euid`") before
# emitting C, so every form stays commented.
p(Process.euid.class)
a001 = Process.euid; p a001.class
r001 = (Process.euid rescue $!.class); p r001
