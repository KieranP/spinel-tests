# frozen_string_literal: true
# IO#inspect

# p001 = "/tmp/sp_io_inspect_1.txt"
# File.write(p001, "data")

## a File's inspect embeds the path, so it is stable across runs
# File.open(p001) { |f| p f.inspect }
# File.open(p001) { |f| p f.inspect.class }
# r001 = File.open(p001) { |f| f.inspect }; p r001

# File.open(p001) do |f|
#   a001 = f.inspect
#   p a001
#   p a001.start_with?("#<File:")
#   p a001.include?(p001)
# end

## a closed File says so
# f002 = File.open(p001)
# f002.close
# p f002.inspect
# b002 = f002.inspect
# p b002

## the standard streams
# p STDOUT.inspect
# p STDERR.inspect
# p STDIN.inspect
# c003 = STDOUT.inspect
# p c003
# d003 = STDIN.inspect
# p d003

## inspect is what p/to_s-in-interp reach for
# File.open(p001) { |f| p f.inspect == f.inspect }
# File.open(p001) do |f|
#   e004 = "#{f.inspect}"
#   p e004.start_with?("#<File:")
# end

## a pipe's inspect carries the fd number, which is not stable across runtimes,
## so assert only its shape
# g005 = IO.pipe
# p g005[0].inspect.start_with?("#<IO:")
# p g005[1].inspect.class
# h005 = g005[0].inspect
# p h005.start_with?("#<IO:")
# g005[0].close
# g005[1].close

# File.delete(p001)
