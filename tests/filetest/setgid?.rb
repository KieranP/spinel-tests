# frozen_string_literal: true
# FileTest.setgid?
f001 = "/tmp/sp_ft_setgid_f"
File.write(f001, "hello")
n001 = "/tmp/sp_ft_setgid_none"
r001 = (FileTest.setgid?(f001) rescue $!.class); p r001
r002 = (FileTest.setgid?(n001) rescue $!.class); p r002
File.delete(f001)
