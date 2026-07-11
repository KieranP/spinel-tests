# frozen_string_literal: true
# FileTest.readable?
f001 = "/tmp/sp_ft_readable_f"
File.write(f001, "hello")
d001 = "/tmp/sp_ft_readable_d"
Dir.mkdir(d001) unless Dir.exist?(d001)
n001 = "/tmp/sp_ft_readable_none"
p FileTest.readable?(f001)
p FileTest.readable?(d001)
p FileTest.readable?(n001)
r001 = FileTest.readable?(f001); p r001
r002 = FileTest.readable?(n001); p r002
File.delete(f001); Dir.rmdir(d001)
