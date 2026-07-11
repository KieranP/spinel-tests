# frozen_string_literal: true
# Enumerator#nil?
p([1, 2, 3].each.nil?)
a006 = [1, 2, 3].each; p(a006.nil?)
a007 = [1, 2, 3].each; v007 = a007.nil?; p v007
