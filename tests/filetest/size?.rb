# frozen_string_literal: true
# FileTest.size?
f001 = "/tmp/sp_ft_sizeq_f"
File.write(f001, "hello")
e001 = "/tmp/sp_ft_sizeq_e"
File.write(e001, "")
n001 = "/tmp/sp_ft_sizeq_none"
p FileTest.size?(f001)
p FileTest.size?(e001)
p FileTest.size?(n001)
r001 = FileTest.size?(f001); p r001
r002 = FileTest.size?(n001); p r002
File.delete(f001); File.delete(e001)
