# frozen_string_literal: true
# IO#close_read
p001 = "/tmp/sp_io_close_read_1.txt"
File.write(p001, "hi")
# closing the read end of a non-duplex IO raises IOError
File.open(p001, "r+") { |f| r001 = (f.close_read rescue $!.class); p r001 }
File.open(p001, "r+") do |f|
  a001 = (f.close_read rescue $!.class)
  p a001
  p f.closed?
end
File.delete(p001)
