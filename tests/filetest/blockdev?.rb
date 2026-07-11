# frozen_string_literal: true
# FileTest.blockdev?
f001 = "/tmp/sp_ft_blockdev_f"
File.write(f001, "hello")
n001 = "/tmp/sp_ft_blockdev_none"
r001 = (FileTest.blockdev?(f001) rescue $!.class); p r001
r002 = (FileTest.blockdev?("/dev/null") rescue $!.class); p r002
r003 = (FileTest.blockdev?(n001) rescue $!.class); p r003
File.delete(f001)
