# frozen_string_literal: true
# Proc#nil?
p(->(a) { a }.nil?)
a006 = ->(a) { a }; p(a006.nil?)
a007 = ->(a) { a }; v007 = a007.nil?; p v007
