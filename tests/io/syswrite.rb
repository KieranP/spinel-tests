# frozen_string_literal: true
# IO#syswrite
p001 = "/tmp/sp_io_syswrite_1.txt"
File.open(p001, "w") { |f| p f.syswrite("abc") }
p File.read(p001)
File.open(p001, "w") { |f| n001 = f.syswrite("hello"); p n001 }
p File.read(p001)
File.open(p001, "w") { |f| p f.syswrite(42) }
p File.read(p001)
File.delete(p001)
