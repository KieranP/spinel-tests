# frozen_string_literal: true
# FileTest.sticky?
f001 = "/tmp/sp_ft_sticky_f"
File.write(f001, "hello")
n001 = "/tmp/sp_ft_sticky_none"
r001 = (FileTest.sticky?(f001) rescue $!.class); p r001
r002 = (FileTest.sticky?(n001) rescue $!.class); p r002
File.delete(f001)
