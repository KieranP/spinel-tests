# frozen_string_literal: true
# IO#to_i
p001 = "/tmp/sp_io_to_i_1.txt"
File.write(p001, "hello world\n")
# to_i returns the file descriptor (an Integer); the exact number is not portable across runtimes, so assert the type
File.open(p001) { |f| p f.to_i.class }
File.open(p001) { |f| a001 = f.to_i; p a001.class }
File.delete(p001)
