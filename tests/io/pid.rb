# frozen_string_literal: true
# IO#pid
p001 = "/tmp/sp_io_pid_1.txt"
File.write(p001, "hello world\n")
File.open(p001) { |f| p f.pid }
File.open(p001) { |f| a001 = f.pid; p a001 }
File.delete(p001)
