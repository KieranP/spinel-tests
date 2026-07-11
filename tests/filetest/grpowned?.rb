# frozen_string_literal: true
# FileTest.grpowned?
f001 = "/tmp/sp_ft_grpowned_f"
File.write(f001, "hello")
n001 = "/tmp/sp_ft_grpowned_none"
r001 = (FileTest.grpowned?(f001) rescue $!.class); p r001
r002 = (FileTest.grpowned?(n001) rescue $!.class); p r002
File.delete(f001)
