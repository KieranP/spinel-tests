# frozen_string_literal: true
# Proc#display
->(a) { a }.class.display
puts
a041 = ->(a) { a }; v041 = a041.class.display; puts; p v041
