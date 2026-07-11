# frozen_string_literal: true
# IO#each_line
p001 = "/tmp/sp_io_each_line_1.txt"
File.write(p001, "one\ntwo\nthree\n")
File.open(p001) { |f| f.each_line { |l| p l } }
File.open(p001) do |f|
  a001 = []
  f.each_line { |l| a001 << l }
  p a001
end

File.open(p001) { |f| f.each_line("o") { |l| p l } }
File.open(p001) { |f| f.each("o") { |l| p l } }
File.delete(p001)
