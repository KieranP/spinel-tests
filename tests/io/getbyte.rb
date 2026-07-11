# frozen_string_literal: true
# IO#getbyte
p001 = "/tmp/sp_io_getbyte_1.txt"
File.write(p001, "hi")
File.open(p001) { |f| p f.getbyte }
File.open(p001) { |f| a001 = f.getbyte; p a001 }
File.delete(p001)
