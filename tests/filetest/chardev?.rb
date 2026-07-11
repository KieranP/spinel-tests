# frozen_string_literal: true
# FileTest.chardev?
f001 = "/tmp/sp_ft_chardev_f"
File.write(f001, "hello")
n001 = "/tmp/sp_ft_chardev_none"
r001 = (FileTest.chardev?(f001) rescue $!.class); p r001
r002 = (FileTest.chardev?("/dev/null") rescue $!.class); p r002
r003 = (FileTest.chardev?(n001) rescue $!.class); p r003
File.delete(f001)
