# frozen_string_literal: true
# FileTest.world_readable?
f001 = "/tmp/sp_ft_wr_f"
File.write(f001, "hello")
File.chmod(0644, f001)
g001 = "/tmp/sp_ft_wr_g"
File.write(g001, "hello")
File.chmod(0600, g001)
n001 = "/tmp/sp_ft_wr_none"
r001 = (FileTest.world_readable?(f001) rescue $!.class); p r001
r002 = (FileTest.world_readable?(g001) rescue $!.class); p r002
r003 = (FileTest.world_readable?(n001) rescue $!.class); p r003
File.delete(f001); File.delete(g001)
