# frozen_string_literal: true
# IO#sysread
p001 = "/tmp/sp_io_sysread_1.txt"
File.write(p001, "hello world\n")
File.open(p001) { |f| p f.sysread(3) }
File.open(p001) { |f| a001 = f.sysread(3); p a001 }
# the output-buffer form fills the buffer and returns that same object
File.open(p001) { |f| b001 = +""; f.sysread(3, b001); p b001 }
File.open(p001) { |f| b002 = +""; c002 = f.sysread(3, b002); p c002.equal?(b002) }
File.delete(p001)
