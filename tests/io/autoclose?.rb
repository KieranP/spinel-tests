# frozen_string_literal: true
# IO#autoclose?
p001 = "/tmp/sp_io_autoclose?_1.txt"
File.write(p001, "hello world\n")
File.open(p001) { |f| p f.autoclose? }
File.open(p001) { |f| a001 = f.autoclose?; p a001 }
File.delete(p001)
