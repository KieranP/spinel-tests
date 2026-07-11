# frozen_string_literal: true
# IO#close_on_exec=
p001 = "/tmp/sp_io_close_on_exec_set_1.txt"
File.write(p001, "hi")
File.open(p001) { |f| p(f.close_on_exec = false) }
File.open(p001) { |f| f.close_on_exec = false; p f.close_on_exec? }
File.open(p001) { |f| f.close_on_exec = true;  p f.close_on_exec? }
File.open(p001) do |f|
  a001 = (f.close_on_exec = false)
  p a001
  p f.close_on_exec?
end
File.delete(p001)
