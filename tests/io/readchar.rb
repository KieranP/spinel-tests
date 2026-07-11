# frozen_string_literal: true
# IO#readchar
p001 = "/tmp/sp_io_readchar_1.txt"
File.write(p001, "hi")
File.open(p001) { |f| p f.readchar }
File.open(p001) { |f| a001 = f.readchar; p a001 }
File.delete(p001)
