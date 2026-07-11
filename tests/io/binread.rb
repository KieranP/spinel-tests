# frozen_string_literal: true
# IO.binread
p001 = "/tmp/sp_io_binread_1.txt"
File.write(p001, "hello")
p IO.binread(p001)
a001 = IO.binread(p001); p a001
File.delete(p001)
