# frozen_string_literal: true
# IO#write
p001 = "/tmp/sp_io_write_1.txt"
File.open(p001, "w") { |f| p f.write("abc") }
p File.read(p001)
File.open(p001, "w") { |f| f.write("hello") }
p File.read(p001)
File.open(p001, "w") { |f| p f.write(42) }
p File.read(p001)
STDOUT.write("to-stdout\n")
b001 = STDOUT.write("count\n"); p b001

File.open(p001, "w") { |f| p f.write("a", "b", "c") }
p File.read(p001)
File.open(p001, "w") { |f| p f.write("a", "b") }
p File.read(p001)

File.open(p001, "w") { |f| n001 = f.write("hi"); p n001 }

# IO.write
p IO.write(p001, "z")
c001 = IO.write(p001, "z"); p c001

File.delete(p001)
