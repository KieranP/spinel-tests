# frozen_string_literal: true
# File.executable_real?
p001 = "/tmp/sp_file_executable_real_1"
File.write(p001, "hi")
File.chmod(0o644, p001)
p File.executable_real?(p001)
a001 = p001
p File.executable_real?(a001)
v001 = File.executable_real?(p001); p v001
p File.executable_real?("/tmp/sp_file_executable_real_nope")
v002 = File.executable_real?("/tmp/sp_file_executable_real_nope"); p v002

## chmod +x flips it
# File.chmod(0o755, p001)
# p File.executable_real?(p001)
# v003 = File.executable_real?(p001); p v003
# File.chmod(0o644, p001)
# p File.executable_real?(p001)

## a directory is "executable" (searchable)
# p File.executable_real?("/tmp")
# v004 = File.executable_real?("/tmp"); p v004

# File.delete(p001)
