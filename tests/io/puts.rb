# frozen_string_literal: true
# IO#puts
p001 = "/tmp/sp_io_puts_1.txt"
File.open(p001, "w") { |f| p f.puts("line") }
p File.read(p001)
File.open(p001, "w") { |f| f.puts("a", "b") }
p File.read(p001)
File.open(p001, "w") do |f|
  a001 = f.puts("z")
  p a001
end
p File.read(p001)
File.open(p001, "w") { |f| f.puts }
p File.read(p001)

File.open(p001, "w") { |f| f.puts([1, 2, 3]) }
p File.read(p001)
File.open(p001, "w") do |f|
  b001 = f.puts([1, 2, 3])
  p b001
end
p File.read(p001)

STDOUT.puts("via-stdout")
$stdout.puts("via-global-stdout")
File.delete(p001)
