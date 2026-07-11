# frozen_string_literal: true
# IO#closed?
p001 = "/tmp/sp_io_closed_1.txt"
File.write(p001, "x")
f001 = File.open(p001)
p f001.closed?
f001.close
p f001.closed?
f002 = File.open(p001)
a001 = f002.closed?
f002.close
b001 = f002.closed?
p a001
p b001
File.delete(p001)
