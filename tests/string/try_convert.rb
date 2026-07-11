# frozen_string_literal: true
# String.try_convert

# p(String.try_convert("abc"))
# a001 = String.try_convert("abc")
# p a001

## a receiver in a variable
# b002 = "hello"
# p(String.try_convert(b002))
# c002 = String.try_convert(b002)
# p c002

## non-String without #to_str returns nil, it does NOT raise
# p(String.try_convert(42))
# p(String.try_convert(nil))
# p(String.try_convert(:sym))
# p(String.try_convert([1, 2]))
# p(String.try_convert(1.5))

# d003 = 99
# p(String.try_convert(d003))
# e003 = String.try_convert(d003)
# p e003

## an object defining #to_str IS converted
# class Strish004
#   def to_str
#     "from_to_str"
#   end
# end
# p(String.try_convert(Strish004.new))
# f004 = Strish004.new
# p(String.try_convert(f004))
# g004 = String.try_convert(f004)
# p g004

## an object defining only #to_s is NOT converted
# class Sish005
#   def to_s
#     "from_to_s"
#   end
# end
# p(String.try_convert(Sish005.new))
# h005 = String.try_convert(Sish005.new)
# p h005

## the result of a successful convert is a String
# p(String.try_convert("abc").class)
# p(String.try_convert(42).nil?)
# i006 = String.try_convert("xyz")
# p i006.class
# p i006.length
