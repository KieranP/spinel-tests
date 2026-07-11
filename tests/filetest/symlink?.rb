# frozen_string_literal: true
# FileTest.symlink?
f001 = "/tmp/sp_ft_symlink_f"
File.write(f001, "hello")
d001 = "/tmp/sp_ft_symlink_d"
Dir.mkdir(d001) unless Dir.exist?(d001)
n001 = "/tmp/sp_ft_symlink_none"
p FileTest.symlink?(f001)
p FileTest.symlink?(d001)
p FileTest.symlink?(n001)
r001 = FileTest.symlink?(f001); p r001
r002 = FileTest.symlink?(n001); p r002
File.delete(f001); Dir.rmdir(d001)
