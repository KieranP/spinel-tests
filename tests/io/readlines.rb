# frozen_string_literal: true
# IO#readlines
p001 = "/tmp/sp_io_readlines_1.txt"
File.write(p001, "one\ntwo\nthree\n")
File.open(p001) { |f| p f.readlines }
r001 = File.open(p001) { |f| f.readlines }; p r001

File.open(p001) { |f| p f.readlines("o") }
File.open(p001) { |f| p f.readlines(chomp: true) }
File.open(p001) do |f|
  a002 = f.readlines("o"); p a002
end

# IO.readlines
p IO.readlines(p001)
a001 = IO.readlines(p001); p a001

File.delete(p001)
