# frozen_string_literal: true
# Dir.mkdir
d001 = "/tmp/sp_dir_mkdir_1"
Dir.rmdir(d001) if Dir.exist?(d001)
p Dir.mkdir(d001)
p Dir.exist?(d001)
Dir.rmdir(d001)
a001 = "/tmp/sp_dir_mkdir_2"
Dir.rmdir(a001) if Dir.exist?(a001)
v001 = Dir.mkdir(a001); p v001
p Dir.exist?(a001)
Dir.rmdir(a001)
b001 = "/tmp/sp_dir_mkdir_3"
Dir.rmdir(b001) if Dir.exist?(b001)
p Dir.mkdir(b001, 0755)
p Dir.exist?(b001)
Dir.rmdir(b001)
c001 = "/tmp/sp_dir_mkdir_4"
Dir.rmdir(c001) if Dir.exist?(c001)
v002 = Dir.mkdir(c001, 0755); p v002
p Dir.exist?(c001)
Dir.rmdir(c001)
