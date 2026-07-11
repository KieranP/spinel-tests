# frozen_string_literal: true
# IO.foreach
p001 = "/tmp/sp_io_foreach_1.txt"
File.write(p001, "one\ntwo\n")
IO.foreach(p001) { |l| p l }
a001 = []; IO.foreach(p001) { |l| a001 << l }; p a001
File.delete(p001)
