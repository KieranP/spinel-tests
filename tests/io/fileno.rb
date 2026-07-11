# frozen_string_literal: true
# IO#fileno
p STDOUT.fileno
p STDERR.fileno
v001 = STDOUT.fileno; p(v001 >= 0)
p001 = "/tmp/sp_io_fileno_1.txt"
File.write(p001, "x")
File.open(p001) { |f| p(f.fileno > 2) }
File.open(p001) { |f| x001 = f.fileno; p(x001 > 2) }

File.open(p001) { |f| p f.fileno.class }
File.open(p001) { |f| y001 = f.fileno.class; p y001 }

File.delete(p001)
