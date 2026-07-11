# frozen_string_literal: true
# IO#fcntl
p001 = "/tmp/sp_io_fcntl_1.txt"
File.write(p001, "hi")
# F_GETFD (cmd 1): ruby-opened files carry FD_CLOEXEC, so this is a stable 1
File.open(p001) { |f| p f.fcntl(1, 0) }
File.open(p001) { |f| v001 = f.fcntl(1, 0); p v001 }
File.open(p001) { |f| r001 = (f.fcntl(1, 0) rescue $!.class); p r001 }
File.open(p001) do |f|
  a001 = (f.fcntl(1, 0) rescue $!.class)
  p a001
end
File.delete(p001)
