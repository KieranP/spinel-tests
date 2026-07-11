# frozen_string_literal: true
# FileTest.owned?
f001 = "/tmp/sp_ft_owned_f"
File.write(f001, "hello")
n001 = "/tmp/sp_ft_owned_none"
r001 = (FileTest.owned?(f001) rescue $!.class); p r001
r002 = (FileTest.owned?(n001) rescue $!.class); p r002
File.delete(f001)
