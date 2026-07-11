# frozen_string_literal: true
# IO#close_on_exec?
p001 = "/tmp/sp_io_close_on_exec_q_1.txt"
File.write(p001, "hi")
File.open(p001) { |f| p f.close_on_exec? }
File.open(p001) { |f| a001 = f.close_on_exec?; p a001 }
File.open(p001) do |f|
  f.close_on_exec = false
  b001 = f.close_on_exec?
  p b001
end
File.delete(p001)
