# frozen_string_literal: true
# IO#fdatasync
p001 = "/tmp/sp_io_fdatasync_1.txt"
File.write(p001, "hello world\n")
File.open(p001) { |f| p f.fdatasync }
File.open(p001) { |f| a001 = f.fdatasync; p a001 }
File.delete(p001)
