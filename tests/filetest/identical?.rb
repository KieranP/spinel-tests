# frozen_string_literal: true
# FileTest.identical?
f001 = "/tmp/sp_ft_identical_f"
File.write(f001, "hello")
d001 = "/tmp/sp_ft_identical_d"
Dir.mkdir(d001) unless Dir.exist?(d001)
n001 = "/tmp/sp_ft_identical_none"
p FileTest.identical?(f001, f001)
p FileTest.identical?(f001, d001)
p FileTest.identical?(f001, n001)
r001 = FileTest.identical?(f001, f001); p r001
r002 = FileTest.identical?(f001, n001); p r002
File.delete(f001); Dir.rmdir(d001)
