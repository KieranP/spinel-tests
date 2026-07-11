# frozen_string_literal: true
# IO#reopen
a001 = "/tmp/sp_io_reopen_a.txt"
b001 = "/tmp/sp_io_reopen_b.txt"
File.write(a001, "aaa")
File.write(b001, "bbbbb")
File.open(a001) { |f| f.reopen(b001); p f.read }
File.open(a001) do |f|
  g001 = File.open(b001)
  f.reopen(g001)
  p f.read
  g001.close
end
File.open(a001) { |f| r001 = f.reopen(b001); p r001.equal?(f) }
File.delete(a001)
File.delete(b001)
