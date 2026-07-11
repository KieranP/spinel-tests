# frozen_string_literal: true
# Integer.try_convert

p(Integer.try_convert(3))
a001 = Integer.try_convert(3); p a001
p(Integer.try_convert("3"))
a002 = Integer.try_convert("3"); p a002
p(Integer.try_convert(3.5))
a003 = Integer.try_convert(3.5); p a003
p(Integer.try_convert(nil))
a004 = Integer.try_convert(nil); p a004
