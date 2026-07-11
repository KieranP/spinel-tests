# frozen_string_literal: true
# Proc#frozen?
p(->(a) { a }.frozen?)
a004 = ->(a) { a }; p(a004.frozen?)
a005 = ->(a) { a }; v005 = a005.frozen?; p v005
