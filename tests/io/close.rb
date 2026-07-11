# frozen_string_literal: true
# IO#close
p001 = "/tmp/sp_io_close_1.txt"
File.write(p001, "x")
f001 = File.open(p001)
f001.close
p f001.closed?
f002 = File.open(p001)
f002.close
p f002.closed?

f003 = File.open(p001)
r001 = f003.close; p r001
p File.open(p001) { |f| f.close }

File.delete(p001)
