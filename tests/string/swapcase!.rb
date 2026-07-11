# frozen_string_literal: true
# String#swapcase!
p((+"Hello").swapcase!)
a01 = +"Hello World"; a01.swapcase!; p a01
a02 = +"aBc123"; a02.swapcase!; p a02
a03 = +"aBc123"; c03 = (a03.swapcase!); p c03
# no letters returns nil (no change)
p((+"123!?").swapcase!)
a04 = +"123!?"; c04 = (a04.swapcase!); p c04
