# frozen_string_literal: true
# File.umask
# Set to a known value so the read-back is deterministic, then restore.
o001 = File.umask(0o022)
p File.umask
v001 = File.umask; p v001
File.umask(o001)
