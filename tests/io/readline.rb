# frozen_string_literal: true
# IO#readline
p001 = "/tmp/sp_io_readline_1.txt"
File.write(p001, "one\ntwo\nthree\n")
File.open(p001) { |f| p f.readline }
File.open(p001) { |f| p f.readline; p f.readline }
r001 = File.open(p001) { |f| f.readline }; p r001
File.open(p001) do |f|
  a001 = f.readline
  b001 = f.readline
  p a001
  p b001
end

File.open(p001) { |f| p f.readline("o") }
File.open(p001) { |f| p f.readline(2) }
File.open(p001) do |f|
  c001 = f.readline("o"); p c001
end

File.open(p001) { |f| f.read; r001 = (f.readline rescue $!.class); p r001 }
File.open(p001) do |f|
  f.read
  r002 = (f.readline rescue $!.class)
  p r002
end
File.delete(p001)
