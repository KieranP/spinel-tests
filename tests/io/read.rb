# frozen_string_literal: true
# IO#read
p001 = "/tmp/sp_io_read_1.txt"
File.write(p001, "hello world")
File.open(p001) { |f| p f.read }
File.open(p001) { |f| p f.read(5) }
r001 = File.open(p001) { |f| f.read }; p r001
r002 = File.open(p001) { |f| f.read(5) }; p r002
File.open(p001) { |f| p f.read(0) }
File.open(p001) { |f| f.read; p f.read; p f.read(3) }
File.open(p001) do |f|
  x001 = f.read(0); p x001
  f.read
  y001 = f.read; p y001
  z001 = f.read(3); p z001
end

File.open(p001) { |f| b001 = +""; f.read(3, b001); p b001 }
File.open(p001) do |f|
  b002 = +""
  r003 = f.read(3, b002)
  p r003
  p b002
end
# a frozen output buffer must raise
File.open(p001) { |f| b003 = ""; r004 = (f.read(3, b003) rescue $!.class); p r004 }

# IO.read
p IO.read(p001)
a001 = IO.read(p001); p a001

File.delete(p001)
