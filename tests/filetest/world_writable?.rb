# frozen_string_literal: true
# FileTest.world_writable?
f001 = "/tmp/sp_ft_wwq_f"
File.write(f001, "hello")
File.chmod(0646, f001)
g001 = "/tmp/sp_ft_wwq_g"
File.write(g001, "hello")
File.chmod(0644, g001)
n001 = "/tmp/sp_ft_wwq_none"
r001 = (FileTest.world_writable?(f001) rescue $!.class); p r001
r002 = (FileTest.world_writable?(g001) rescue $!.class); p r002
r003 = (FileTest.world_writable?(n001) rescue $!.class); p r003
File.delete(f001); File.delete(g001)
