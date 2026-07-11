# frozen_string_literal: true
# IO#each_char
p001 = "/tmp/sp_io_each_char_1.txt"
File.write(p001, "hi")
File.open(p001) { |f| f.each_char { |c| p c } }
File.open(p001) { |f| a001 = []; f.each_char { |c| a001 << c }; p a001 }
File.delete(p001)
