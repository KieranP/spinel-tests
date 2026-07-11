# frozen_string_literal: true
# IO#seek
p001 = "/tmp/sp_io_seek_1.txt"
File.write(p001, "hello world")
File.open(p001) { |f| f.seek(6); p f.read }
File.open(p001) { |f| p f.seek(6) }
File.open(p001) do |f|
  a001 = f.seek(6)
  p a001
  b001 = f.read
  p b001
end
File.open(p001) { |f| p f.seek(2) }
File.open(p001) { |f| f.seek(2, IO::SEEK_SET); p f.read }
File.open(p001) { |f| f.read(2); f.seek(2, IO::SEEK_CUR); p f.read }
File.open(p001) { |f| f.seek(-2, IO::SEEK_END); p f.read }
File.open(p001) do |f|
  c001 = f.seek(2, IO::SEEK_SET)
  p c001
  d001 = f.read
  p d001
end
File.delete(p001)
