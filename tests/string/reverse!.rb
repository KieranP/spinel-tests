# frozen_string_literal: true
# String#reverse!
p((+"hello").reverse!)
a01 = +"hello"; a01.reverse!; p a01
a02 = +"abcdef"; c02 = (a02.reverse!); p c02
# reverse! always returns the (mutated) receiver, even for a palindrome
p((+"aba").reverse!)
a03 = +""; a03.reverse!; p a03
