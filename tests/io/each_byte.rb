# frozen_string_literal: true
# IO#each_byte
p001 = "/tmp/sp_io_each_byte_1.txt"
File.write(p001, "hi")
File.open(p001) { |f| f.each_byte { |b| p b } }
File.open(p001) { |f| a001 = []; f.each_byte { |b| a001 << b }; p a001 }
File.delete(p001)
