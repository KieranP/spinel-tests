# frozen_string_literal: true
# File.world_readable?
p001 = "/tmp/sp_file_wreadable_1"
File.write(p001, "hi")
File.chmod(0o644, p001)
p File.world_readable?(p001)
a001 = p001; p File.world_readable?(a001)
v001 = File.world_readable?(p001); p v001
File.delete(p001)
