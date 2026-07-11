# frozen_string_literal: true
# IO#fsync
p001 = "/tmp/sp_io_fsync_1.txt"
File.write(p001, "hello world\n")
File.open(p001) { |f| p f.fsync }
File.open(p001) { |f| a001 = f.fsync; p a001 }
File.delete(p001)
