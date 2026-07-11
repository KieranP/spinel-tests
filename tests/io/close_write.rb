# frozen_string_literal: true
# IO#close_write
p001 = "/tmp/sp_io_close_write_1.txt"
File.write(p001, "hi")
# closing the write end of a non-duplex IO raises IOError
File.open(p001, "r+") { |f| r001 = (f.close_write rescue $!.class); p r001 }
File.open(p001, "r+") do |f|
  a001 = (f.close_write rescue $!.class)
  p a001
  p f.closed?
end
File.delete(p001)
