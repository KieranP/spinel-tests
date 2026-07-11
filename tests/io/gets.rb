# frozen_string_literal: true
# IO#gets
p001 = "/tmp/sp_io_gets_1.txt"
File.write(p001, "alpha\nbeta\ngamma\n")
File.open(p001) { |f| p f.gets }
File.open(p001) { |f| p f.gets; p f.gets }
r001 = File.open(p001) { |f| f.gets }; p r001
File.open(p001) do |f|
  a001 = f.gets
  b001 = f.gets
  p a001
  p b001
end
File.open(p001) { |f| f.read; p f.gets }
File.open(p001) do |f|
  f.read
  c001 = f.gets; p c001
end

File.open(p001) { |f| p f.gets("a") }
File.open(p001) { |f| p f.gets(3) }
File.open(p001) { |f| p f.gets(chomp: true) }
File.open(p001) do |f|
  d001 = f.gets("a"); p d001
end
File.delete(p001)
