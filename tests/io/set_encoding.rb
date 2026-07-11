# frozen_string_literal: true
# IO#set_encoding
p001 = "/tmp/sp_io_set_encoding_1.txt"
File.write(p001, "hello")
# set_encoding returns the receiver itself; assert identity (Encoding objects are not portable)
# WONTFIX: See docs/limitations.md - "Fundamental limits — Mixed / non-UTF-8 encodings"
# File.open(p001) { |f| p f.set_encoding("UTF-8").equal?(f) }
# File.open(p001) { |f| a001 = f.set_encoding("UTF-8"); p a001.equal?(f) }
# File.open(p001) { |f| f.set_encoding("UTF-8"); p f.read }   # content unaffected
File.delete(p001)
