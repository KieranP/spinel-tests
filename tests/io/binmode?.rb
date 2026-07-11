# frozen_string_literal: true
# IO#binmode?
p001 = "/tmp/sp_io_binmode_q_1.txt"
File.write(p001, "hi")
File.open(p001) { |f| p f.binmode? }
File.open(p001) { |f| f.binmode; p f.binmode? }
File.open(p001) do |f|
  a001 = f.binmode?
  f.binmode
  b001 = f.binmode?
  p a001
  p b001
end
File.delete(p001)
