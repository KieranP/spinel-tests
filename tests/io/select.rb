# frozen_string_literal: true
# IO.select

# p001 = "/tmp/sp_io_select_1.txt"
# File.write(p001, "content")

## a readable regular file is always ready
# File.open(p001) { |f| p IO.select([f], nil, nil, 0).nil? }
# File.open(p001) { |f| r001 = IO.select([f], nil, nil, 0); p r001[0].size }
# File.open(p001) do |f|
#   a001 = IO.select([f], nil, nil, 0)
#   p a001.class
#   p a001.size
#   p a001[0][0].equal?(f)
#   p a001[1]
#   p a001[2]
# end

## a pipe with buffered data is readable
# r002, w002 = IO.pipe
# w002.write("ping")
# p(IO.select([r002], nil, nil, 0).nil?)
# b002 = IO.select([r002], nil, nil, 0)
# p b002[0].size
# p r002.read(4)

## an empty pipe times out and returns nil
# p(IO.select([r002], nil, nil, 0))
# c003 = IO.select([r002], nil, nil, 0)
# p c003

## the write end is writable
# p(IO.select(nil, [w002], nil, 0).nil?)
# d004 = IO.select(nil, [w002], nil, 0)
# p d004[1].size
# p d004[0]

## both directions in one call
# w002.write("x")
# e005 = IO.select([r002], [w002], nil, 0)
# p e005[0].size
# p e005[1].size
# p r002.read(1)

## an all-empty select with a zero timeout returns nil
# p(IO.select([], [], [], 0))
# f006 = IO.select([], nil, nil, 0)
# p f006

# w002.close
# r002.close
# File.delete(p001)
