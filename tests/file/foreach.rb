# frozen_string_literal: true
# File.foreach
p001 = "/tmp/sp_file_foreach_1"
File.write(p001, "hello\nworld\n")
File.foreach(p001) { |line| p line }
a001 = p001
File.foreach(a001) { |line| p line }
v001 = File.foreach(p001) { |line| line }; p v001
e001 = File.foreach(p001).class; p e001
File.delete(p001)
