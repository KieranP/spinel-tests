# frozen_string_literal: true
# IO#sysseek
p001 = "/tmp/sp_io_sysseek_1.txt"
File.write(p001, "hello world\n")
File.open(p001) { |f| p f.sysseek(2) }
File.open(p001) { |f| a001 = f.sysseek(2); p a001 }
File.delete(p001)
