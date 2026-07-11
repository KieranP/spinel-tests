# frozen_string_literal: true
# IO#lineno
# IO#lineno=
p001 = "/tmp/sp_io_lineno_1.txt"
File.write(p001, "a\nb\n")
File.open(p001) { |f| f.gets; p f.lineno }
File.open(p001) { |f| f.gets; a001 = f.lineno; p a001 }
File.open(p001) { |f| f.lineno = 5; p f.lineno }
File.delete(p001)
