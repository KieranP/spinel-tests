# frozen_string_literal: true
# IO#print
p001 = "/tmp/sp_io_print_1.txt"
File.open(p001, "w") { |f| p f.print("x") }
p File.read(p001)
File.open(p001, "w") { |f| f.print("a", "b", "c") }
p File.read(p001)
File.open(p001, "w") do |f|
  a001 = f.print("z")
  p a001
end
p File.read(p001)
File.open(p001, "w") { |f| f.print("a", "b") }
p File.read(p001)
File.open(p001, "w") { |f| f.print(1, 2, 3) }
p File.read(p001)
STDOUT.print("s1", "s2", "\n")
b001 = STDOUT.print("s3\n"); p b001
File.delete(p001)
