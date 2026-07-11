# frozen_string_literal: true
# IO#pwrite
p001 = "/tmp/sp_io_pwrite_1.txt"
File.write(p001, "hello world")
File.open(p001, "r+") { |f| p f.pwrite("AB", 0) }
p File.read(p001)
File.write(p001, "hello world")
File.open(p001, "r+") { |f| n001 = f.pwrite("XY", 6); p n001 }
p File.read(p001)
File.write(p001, "hello world")
File.open(p001, "r+") do |f|
  # pwrite does not advance the file position
  f.pwrite("Z", 0)
  a001 = f.pos
  p a001
end
File.delete(p001)
