# frozen_string_literal: true
# IO#read_nonblock
p001 = "/tmp/sp_io_read_nonblock_1.txt"
File.write(p001, "hello world")
# on a regular file with data available, read_nonblock reads immediately
File.open(p001) { |f| p f.read_nonblock(5) }
File.open(p001) { |f| v001 = f.read_nonblock(5); p v001 }
File.open(p001) { |f| r001 = (f.read_nonblock(5) rescue $!.class); p r001 }
File.open(p001) do |f|
  a001 = (f.read_nonblock(5) rescue $!.class)
  p a001
end
File.delete(p001)
