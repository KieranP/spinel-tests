# frozen_string_literal: true
# IO#<<
p001 = "/tmp/sp_io_lshift_1.txt"
File.open(p001, "w") { |f| f << "a" << "b" << "c" }
p File.read(p001)
File.open(p001, "w") { |f| f << "hello" }
v001 = File.read(p001); p v001
STDOUT << "stream\n"

File.open(p001, "w") do |f|
  h001 = f
  h001 << "a"
  h001 << "b"
end
p File.read(p001)

File.delete(p001)
