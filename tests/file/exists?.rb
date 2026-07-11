# frozen_string_literal: true
# File.exists?
p001 = "/tmp/sp_file_exists_1"
File.write(p001, "hi")
r001 = (File.exists?(p001) rescue $!.class)
p r001
r002 = (begin; File.exists?(p001); rescue => e001; e001.class.name; end)
p r002
File.delete(p001)
