# frozen_string_literal: true
# IO.for_fd

# p001 = "/tmp/sp_io_for_fd_1.txt"
# File.write(p001, "hello for_fd")

## wrap an existing descriptor; autoclose:false keeps the original File owning it
# f001 = File.open(p001)
# i001 = IO.for_fd(f001.fileno, autoclose: false)
# p i001.class
# p i001.fileno == f001.fileno
# p i001.read
# i001.close
# f001.close

# f002 = File.open(p001)
# a002 = IO.for_fd(f002.fileno, autoclose: false)
# p a002.class
# b002 = a002.read
# p b002
# a002.close
# f002.close

## a mode argument is accepted
# f003 = File.open(p001)
# c003 = IO.for_fd(f003.fileno, "r", autoclose: false)
# p c003.class
# p c003.read(5)
# c003.close
# f003.close

## fd 1 is STDOUT: writing through the wrapper reaches stdout
# d004 = IO.for_fd(1, "w", autoclose: false)
# d004.write("via fd 1\n")
# d004.flush
# p d004.fileno
# d004.close

## the wrapper reports the same fileno it was handed
# f005 = File.open(p001)
# e005 = IO.for_fd(f005.fileno, autoclose: false)
# p e005.fileno == f005.fileno
# p e005.tty?
# e005.close
# f005.close

## a nonsense descriptor raises
# r006 = (IO.for_fd(9999).read rescue $!.class); p r006
# r007 = (IO.for_fd(-1) rescue $!.class); p r007

# File.delete(p001)
