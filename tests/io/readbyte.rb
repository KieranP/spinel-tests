# frozen_string_literal: true
# IO#readbyte
p001 = "/tmp/sp_io_readbyte_1.txt"
File.write(p001, "hi")
File.open(p001) { |f| p f.readbyte }
File.open(p001) { |f| a001 = f.readbyte; p a001 }
File.open(p001) do |f|
  f.readbyte
  b001 = f.readbyte
  p b001
end
File.open(p001) do |f|
  f.readbyte
  f.readbyte
  r001 = (f.readbyte rescue $!.class)
  p r001
end
File.delete(p001)
