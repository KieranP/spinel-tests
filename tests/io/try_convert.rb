# frozen_string_literal: true
# IO.try_convert

# p001 = "/tmp/sp_io_try_convert_1.txt"
# File.write(p001, "data")

## an IO converts to itself
# File.open(p001) { |f| p IO.try_convert(f).class }
# File.open(p001) { |f| p IO.try_convert(f).equal?(f) }
# r001 = File.open(p001) { |f| IO.try_convert(f).class }; p r001

## non-IO without #to_io returns nil, it does NOT raise
# p(IO.try_convert("a string"))
# p(IO.try_convert(42))
# p(IO.try_convert(nil))
# p(IO.try_convert([1, 2]))

# a002 = p001
# p(IO.try_convert(a002))
# b002 = IO.try_convert(a002)
# p b002

## STDOUT is an IO
# p(IO.try_convert(STDOUT).class)
# c003 = IO.try_convert(STDOUT)
# p c003.class

## an object defining #to_io IS converted
# class Ioish004
#   def initialize(io)
#     @io = io
#   end

#   def to_io
#     @io
#   end
# end
# File.open(p001) { |f| p IO.try_convert(Ioish004.new(f)).class }
# File.open(p001) do |f|
#   w004 = Ioish004.new(f)
#   d004 = IO.try_convert(w004)
#   p d004.class
#   p d004.equal?(f)
# end

# p(IO.try_convert(42).nil?)
# e005 = IO.try_convert(:sym)
# p e005

# File.delete(p001)
