# frozen_string_literal: true
# IO#rewind
p001 = "/tmp/sp_io_rewind_1.txt"
File.write(p001, "hello")
File.open(p001) { |f| f.read(3); f.rewind; p f.pos }
File.open(p001) { |f| f.read(3); p f.rewind }
File.open(p001) do |f|
  f.read(3)
  a001 = f.rewind
  p a001
  p f.pos
end
File.delete(p001)
