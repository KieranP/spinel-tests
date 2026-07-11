# frozen_string_literal: true
# FileTest.executable?
f001 = "/tmp/sp_ft_exec_f"
File.write(f001, "hello")
File.chmod(0644, f001)
g001 = "/tmp/sp_ft_exec_g"
File.write(g001, "hello")
File.chmod(0755, g001)
n001 = "/tmp/sp_ft_exec_none"
p FileTest.executable?(f001)
p FileTest.executable?(g001)
p FileTest.executable?(n001)
r001 = FileTest.executable?(g001); p r001
r002 = FileTest.executable?(n001); p r002
File.delete(f001); File.delete(g001)
