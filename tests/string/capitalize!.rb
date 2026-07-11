# frozen_string_literal: true
# String#capitalize!
p((+"hello").capitalize!)
a01 = +"hello world"; a01.capitalize!; p a01
a02 = +"hELLO"; a02.capitalize!; p a02
a03 = +"hELLO"; c03 = (a03.capitalize!); p c03
# already capitalized returns nil (no change)
p((+"Hello").capitalize!)
a04 = +"Hello"; c04 = (a04.capitalize!); p c04
# empty string returns nil
p((+"").capitalize!)
