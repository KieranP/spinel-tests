# frozen_string_literal: true
# IO#to_io
p001 = "/tmp/sp_io_to_io_1.txt"
File.write(p001, "hi")
# to_io returns the receiver itself; assert identity (raw #inspect of an IO is not portable)
File.open(p001) { |f| p f.to_io.equal?(f) }
File.open(p001) { |f| a001 = f.to_io; p a001.equal?(f) }
File.delete(p001)
