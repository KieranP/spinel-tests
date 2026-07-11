# frozen_string_literal: true
# IO#wait_readable

# p001 = "/tmp/sp_io_wait_readable_1.txt"
# File.write(p001, "content")

## a regular file is immediately readable, and returns self
# File.open(p001) { |f| p f.wait_readable(0).equal?(f) }
# File.open(p001) { |f| p f.wait_readable(0).class }
# r001 = File.open(p001) { |f| f.wait_readable(0).class }; p r001
# File.open(p001) do |f|
#   a001 = f.wait_readable(0)
#   p a001.equal?(f)
#   p a001.class
# end

## a pipe with buffered data is readable
# r002, w002 = IO.pipe
# w002.write("ping")
# p r002.wait_readable(0).equal?(r002)
# b002 = r002.wait_readable(0)
# p b002.equal?(r002)
# p r002.read(4)

## an empty pipe times out and returns nil
# p r002.wait_readable(0)
# c003 = r002.wait_readable(0)
# p c003

## a short but non-zero timeout also expires to nil
# p r002.wait_readable(0.01)
# d004 = r002.wait_readable(0.01)
# p d004

## a closed write end makes the read end readable (EOF is "ready")
# w002.write("last")
# w002.close
# p r002.wait_readable(0).equal?(r002)
# p r002.read
# e005 = r002.wait_readable(0)
# p e005.equal?(r002)
# p r002.read
# r002.close

## calling it on a closed IO raises
# f006 = File.open(p001)
# f006.close
# r006 = (f006.wait_readable(0) rescue $!.class); p r006

# File.delete(p001)
