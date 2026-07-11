# frozen_string_literal: true
# IO#pread
p001 = "/tmp/sp_io_pread_1.txt"
File.write(p001, "hello world")
File.open(p001) { |f| p f.pread(5, 0) }
File.open(p001) { |f| p f.pread(5, 6) }
File.open(p001) { |f| a001 = f.pread(5, 0); p a001 }
File.open(p001) do |f|
  # pread does not advance the file position
  f.pread(5, 6)
  b001 = f.pos
  p b001
end
File.open(p001) { |f| c001 = +""; f.pread(5, 0, c001); p c001 }
File.open(p001) { |f| d001 = +""; e001 = f.pread(5, 0, d001); p e001 }
# a frozen output buffer must raise
File.open(p001) { |f| c002 = ""; r002 = (f.pread(5, 0, c002) rescue $!.class); p r002 }
File.delete(p001)
