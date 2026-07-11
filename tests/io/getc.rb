# frozen_string_literal: true
# IO#getc
p001 = "/tmp/sp_io_getc_1.txt"
File.write(p001, "hi")
File.open(p001) { |f| p f.getc }
File.open(p001) { |f| a001 = f.getc; p a001 }
File.delete(p001)
