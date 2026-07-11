# frozen_string_literal: true
# FileTest.size
f001 = "/tmp/sp_ft_size_f"
File.write(f001, "hello")
n001 = "/tmp/sp_ft_size_none"
p FileTest.size(f001)
r001 = FileTest.size(f001); p r001
r002 = (FileTest.size(n001) rescue $!.class); p r002
File.delete(f001)
