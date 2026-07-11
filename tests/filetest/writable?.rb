# frozen_string_literal: true
# FileTest.writable?
f001 = "/tmp/sp_ft_writable_f"
File.write(f001, "hello")
d001 = "/tmp/sp_ft_writable_d"
Dir.mkdir(d001) unless Dir.exist?(d001)
n001 = "/tmp/sp_ft_writable_none"
p FileTest.writable?(f001)
p FileTest.writable?(d001)
p FileTest.writable?(n001)
r001 = FileTest.writable?(f001); p r001
r002 = FileTest.writable?(n001); p r002
File.delete(f001); Dir.rmdir(d001)
