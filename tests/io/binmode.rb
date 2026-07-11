# frozen_string_literal: true
# IO#binmode
p001 = "/tmp/sp_io_binmode_1.txt"
File.write(p001, "hello world\n")
# binmode returns the receiver itself; assert identity (raw #inspect of an IO is not portable)
File.open(p001) { |f| p f.binmode.equal?(f) }
File.open(p001) { |f| a001 = f.binmode; p a001.equal?(f) }
File.delete(p001)
