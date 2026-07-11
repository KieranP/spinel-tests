# frozen_string_literal: true
# IO#write_nonblock
p001 = "/tmp/sp_io_write_nonblock_1.txt"
# on a regular file, write_nonblock writes immediately
File.open(p001, "w") { |f| p f.write_nonblock("abc") }
p File.read(p001)
File.open(p001, "w") { |f| v001 = f.write_nonblock("hello"); p v001 }
p File.read(p001)
File.open(p001, "w") { |f| r001 = (f.write_nonblock("abc") rescue $!.class); p r001 }
File.open(p001, "w") do |f|
  a001 = (f.write_nonblock("hello") rescue $!.class)
  p a001
end
File.delete(p001)
