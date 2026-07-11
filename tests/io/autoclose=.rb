# frozen_string_literal: true
# IO#autoclose=
p001 = "/tmp/sp_io_autoclose_set_1.txt"
File.write(p001, "hi")
File.open(p001) { |f| p(f.autoclose = false) }
File.open(p001) { |f| f.autoclose = false; p f.autoclose? }
File.open(p001) { |f| f.autoclose = true;  p f.autoclose? }
File.open(p001) do |f|
  a001 = (f.autoclose = false)
  p a001
  p f.autoclose?
end
File.delete(p001)
