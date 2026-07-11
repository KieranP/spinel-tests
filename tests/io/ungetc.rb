# frozen_string_literal: true
# IO#ungetc
p001 = "/tmp/sp_io_ungetc_1.txt"
File.write(p001, "hello world\n")
File.open(p001) { |f| p f.ungetc("x") }
File.open(p001) { |f| a001 = f.ungetc("x"); p a001 }
File.delete(p001)
