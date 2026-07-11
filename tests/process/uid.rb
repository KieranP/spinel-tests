# frozen_string_literal: true
# Process.uid

# Returns the real user id of this process (an Integer). The concrete value is
# non-deterministic and machine-specific, so only the class / positivity would
# be asserted. Spinel rejects the call at compile time ("unsupported call
# `uid`") before emitting C, so every form — including the rescue-wrapped probe
# — fails to build and stays commented.
p(Process.uid.class)
a001 = Process.uid; p a001.class
r001 = (Process.uid rescue $!.class); p r001
