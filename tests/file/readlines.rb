# frozen_string_literal: true
# File.readlines
p001 = "/tmp/sp_file_readlines_1"
File.write(p001, "hello\nworld\n")
p File.readlines(p001)
a001 = p001
p File.readlines(a001)
v001 = File.readlines(p001); p v001
p File.readlines(p001, chomp: true)
v002 = File.readlines(p001, chomp: true); p v002
p File.readlines(p001, "o")
v003 = File.readlines(p001, "o"); p v003
File.delete(p001)
