# frozen_string_literal: true
# IO#wait_writable

# p001 = "/tmp/sp_io_wait_writable_1.txt"

## a file open for writing is immediately writable, and returns self
# File.open(p001, "w") { |f| p f.wait_writable(0).equal?(f) }
# File.open(p001, "w") { |f| p f.wait_writable(0).class }
# r001 = File.open(p001, "w") { |f| f.wait_writable(0).class }; p r001
# File.open(p001, "w") do |f|
#   a001 = f.wait_writable(0)
#   p a001.equal?(f)
#   p a001.class
# end

## an empty pipe's write end is writable
# r002, w002 = IO.pipe
# p w002.wait_writable(0).equal?(w002)
# b002 = w002.wait_writable(0)
# p b002.equal?(w002)

## with no timeout argument it blocks until ready, which here is immediate
# p w002.wait_writable.equal?(w002)
# c003 = w002.wait_writable
# p c003.equal?(w002)

## a non-zero timeout on an already-ready fd still returns self at once
# p w002.wait_writable(0.01).equal?(w002)
# d004 = w002.wait_writable(0.5)
# p d004.equal?(w002)

## STDOUT is writable
# p STDOUT.wait_writable(0).equal?(STDOUT)
# e005 = STDOUT.wait_writable(0)
# p e005.equal?(STDOUT)

# w002.close
# r002.close

## calling it on a closed IO raises
# f006 = File.open(p001, "w")
# f006.close
# r006 = (f006.wait_writable(0) rescue $!.class); p r006

# File.delete(p001)
