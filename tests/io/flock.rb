# frozen_string_literal: true
# IO#flock
p001 = "/tmp/sp_io_flock_1.txt"
File.write(p001, "hello world\n")
File.open(p001) { |f| p f.flock(File::LOCK_EX) }
File.open(p001) { |f| a001 = f.flock(File::LOCK_EX); p a001 }
File.delete(p001)
