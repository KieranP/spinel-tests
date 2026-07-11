# frozen_string_literal: true
# FileTest.zero?
f001 = "/tmp/sp_ft_zero_f"
File.write(f001, "hello")
e001 = "/tmp/sp_ft_zero_e"
File.write(e001, "")
n001 = "/tmp/sp_ft_zero_none"
p FileTest.zero?(f001)
p FileTest.zero?(e001)
p FileTest.zero?(n001)
r001 = FileTest.zero?(e001); p r001
r002 = FileTest.zero?(n001); p r002
File.delete(f001); File.delete(e001)
