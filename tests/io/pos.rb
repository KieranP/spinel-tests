# frozen_string_literal: true
# IO#pos
# IO#tell
p001 = "/tmp/sp_io_pos_1.txt"
File.write(p001, "hello")
File.open(p001) { |f| f.read(2); p f.pos }
File.open(p001) { |f| f.read(2); p f.tell }
File.open(p001) do |f|
  f.read(3)
  a001 = f.pos
  b001 = f.tell
  p a001
  p b001
end

# IO#pos=
File.open(p001) { |f| f.pos = 2; p f.read }
File.open(p001) { |f| c001 = (f.pos = 2); p c001 }

File.delete(p001)
