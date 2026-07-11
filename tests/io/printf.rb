# frozen_string_literal: true
# IO#printf
p001 = "/tmp/sp_io_printf_1.txt"
File.open(p001, "w") { |f| f.printf("%03d", 7) }
p File.read(p001)
File.open(p001, "w") { |f| a001 = f.printf("%03d", 7); p a001 }
STDOUT.printf("%03d\n", 7)
