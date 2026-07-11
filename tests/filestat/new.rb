# frozen_string_literal: true
# File::Stat.new
p001 = "/tmp/sp_filestat_new"
File.write(p001, "hello")
p File::Stat.new(p001).size
a001 = p001; p File::Stat.new(a001).size
v001 = File::Stat.new(p001); p v001.size
r001 = (File::Stat.new(p001).size rescue $!.class); p r001
File.delete(p001)
