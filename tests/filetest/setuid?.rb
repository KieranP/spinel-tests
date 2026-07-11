# frozen_string_literal: true
# FileTest.setuid?
f001 = "/tmp/sp_ft_setuid_f"
File.write(f001, "hello")
n001 = "/tmp/sp_ft_setuid_none"
r001 = (FileTest.setuid?(f001) rescue $!.class); p r001
r002 = (FileTest.setuid?(n001) rescue $!.class); p r002
File.delete(f001)
