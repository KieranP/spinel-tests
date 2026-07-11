# frozen_string_literal: true
# IO#eof
p001 = "/tmp/sp_io_eof_alias_1.txt"
File.write(p001, "abc")
File.open(p001) { |f| p f.eof }
File.open(p001) { |f| f.read; p f.eof }
File.open(p001) do |f|
  a001 = f.eof
  f.read
  b001 = f.eof
  p a001
  p b001
end
File.delete(p001)
