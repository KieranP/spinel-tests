# frozen_string_literal: true
# Process.groups

# The supplementary group ids of this process (an Array of Integer). Read-only
# and safe, but the contents are machine-specific so only the class would be
# asserted. Spinel rejects the call at compile time ("unsupported call
# `groups`") before emitting C, so every form stays commented.
p(Process.groups.class)
a001 = Process.groups; p a001.class
r001 = (Process.groups rescue $!.class); p r001
