# frozen_string_literal: true
# FileTest.empty?
f001 = "/tmp/sp_ft_empty_f"
File.write(f001, "hello")
e001 = "/tmp/sp_ft_empty_e"
File.write(e001, "")
n001 = "/tmp/sp_ft_empty_none"
p FileTest.empty?(f001)
p FileTest.empty?(e001)
p FileTest.empty?(n001)
r001 = FileTest.empty?(e001); p r001
r002 = FileTest.empty?(n001); p r002
File.delete(f001); File.delete(e001)
