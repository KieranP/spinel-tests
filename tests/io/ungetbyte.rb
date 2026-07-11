# frozen_string_literal: true
# IO#ungetbyte
p001 = "/tmp/sp_io_ungetbyte_1.txt"
File.write(p001, "hi")
File.open(p001) { |f| p f.ungetbyte(65) }
File.open(p001) { |f| a001 = f.ungetbyte(65); p a001 }
File.open(p001) do |f|
  f.ungetbyte(65)
  b001 = f.read
  p b001
end
File.open(p001) do |f|
  f.getbyte
  f.ungetbyte(104)
  c001 = f.read
  p c001
end
File.delete(p001)
