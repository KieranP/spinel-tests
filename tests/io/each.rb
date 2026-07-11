# frozen_string_literal: true
# IO#each
p001 = "/tmp/sp_io_each_1.txt"
File.write(p001, "one\ntwo\nthree\n")
File.open(p001) { |f| f.each { |l| p l } }
File.open(p001) do |f|
  a001 = []
  f.each { |l| a001 << l }
  p a001
end
File.delete(p001)
